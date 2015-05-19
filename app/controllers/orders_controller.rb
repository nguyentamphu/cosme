class OrdersController < ApplicationController
  layout 'public'
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  #Check Session is user login and require user login before use action
  def check_session
    if session[:id].blank? || session[:id]==nil
      redirect_to  new_cart_path , notice: "Please login to Continue payment!!!!"
    end
  end

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.where(is_delete: '0', account_id: session[:id])
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @orders_details= OrdersDetail.where(is_delete: '0', order_id: params[:id])
  end

  # GET /orders/new
  def new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    # render json: params
    @order = Order.new(amount: params[:total] , account_id: session[:id] )
    @order.is_delete =0
    @order.active_status = false
    @order.pay_status = false
    @order.ship_status =false
    if @order.save
      order = Order.select("id").order("id DESC").limit(1)
      session[:cart].each do |s|
        @orders_detail = OrdersDetail.new(price: s[1]["amount"], quantity: s[1]["qty"],
                                          order_id: order[0]["id"]  , product_id: s[1]["id"])
        @orders_detail.is_delete =0
        @orders_detail.save
        product = Product.find_by(id: s[1]["id"])
        product.quantity = (product.quantity - s[1]["qty"].to_i)
        product.save
      end
      acc = Account.find(session[:id])
      # binding.pry
      SendMailer.send_email(acc.email, acc.full_name, session[:cart]).deliver
    end
    session[:cart] = nil
    redirect_to products_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:account_id,:active_status, :pay_status, :ship_status, :pay_type, :amount, :ship_at, :is_delete)
  end
end
