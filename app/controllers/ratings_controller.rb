class RatingsController < ApplicationController
  # POST /ratings
  # POST /ratings.json
  def create
    # binding.pry

    @rating = Rating.new(product_id: params[:product_id],
                         account_id: params[:user_id], rating: params[:rating])
    # rating = Rating.find_by(product_id: params[:product_id])
    # if rating.present?
    #   redirect_to product_path(params[:product_id]), notice: "Sorry, You've rated!"
    # else
      @rating.save
      redirect_to product_path(params[:product_id])
    # end
  end

  def destroy

    @rating = Rating.find_by_account_id(session[:id])
    @rating.destroy
    # binding.pry
    redirect_to product_path(params[:id])
  end
end
