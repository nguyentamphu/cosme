class CartsController < ApplicationController
  layout 'public'

  def new
    if session[:cart] == nil
      redirect_to products_path
    end
  end

  def create
    # render json: params
    if session[:cart].present?
      if !session[:cart][params[:id]].blank?
        session[:cart][params[:id]]["qty"] =(session[:cart][params[:id]]["qty"].to_i + 1).to_s
        session[:cart][params[:id]]["amount"] = (session[:cart][params[:id]]["qty"].to_i  * price).to_s
      else
        cart = Cart.new(params[:id], params[:name], params[:image_id],
                        params[:image], params[:qty], params[:price], price, params[:sale],  price)
        @cart =cart.as_json
        session[:cart][params[:id]] = @cart
      end
    else
      cart = Cart.new(params[:id], params[:name], params[:image_id],
                      params[:image], params[:qty], params[:price], price, params[:sale],  price)
      @cart =cart.as_json
      session[:cart] = {}
      session[:cart][params[:id]] = @cart
    end
    redirect_to products_path
  end

  def update_qty
    total = 0
    pro = Product.find_by(id: params[:id])
    session[:cart].each do |s|
      params.each do |k,v|
        if s[1]["id"] == k
          if pro.quantity < v.to_i
            @tb = "We are #{pro.quantity} #{pro.name}. Please select your quantity!!!"
          else
            s[1]['qty'] = v
            s[1]['amount'] = s[1]['qty'].to_i * s[1]['price'].to_i
            total = (total +s[1]["amount"].to_i)
            @tb = nil
          end
        end
      end
    end
    render json: {"tb"=> @tb , "total"=> total, "session_cart"=>session[:cart]}
  end

  def destroy
    session[:cart].each do |s|
      if s[1]['id']== params[:id]
        session[:cart].delete(params[:id])
        redirect_to new_cart_path
      end
    end
  end


  private
  def price
    if params[:sale]== 0
      params[:price].to_i
    else
      (params[:price].to_i - (params[:price].to_i * params[:sale].to_i/100))
    end
  end

end

class Cart
  def initialize(id, name, image_id, image, qty, old_price, price, sale, amount)
    @id, @name, @image_id,  @image, @qty, @old_price, @price,
      @sale, @amount = id, name, image_id, image, qty, old_price, price, sale, amount
  end
end
