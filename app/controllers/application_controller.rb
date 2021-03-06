class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :set_category
  before_action :set_image
  protect_from_forgery with: :exception
  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @medium_categories = Category.select(:id, :name)
    .where('(parent_id <> 0 or parent_id <> "null" )
      and (is_delete = 0 or is_delete = "null")')
  end
  def set_image
    @advs     = Adv.all
    @slide    = Slider.all
    @articles = Article.all
  end
end