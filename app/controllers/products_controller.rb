class ProductsController < ApplicationController
  before_action :products_layout
  layout :products_layout

  def index
    @products = Product.search(params[:search]).group('products.id').page(params[:page]).per_page(12)
    @articles = Article.all.where(is_delete: 0)
  end

  def show
    # @product_images = ProductImage.where('product_id =?', params[:id])
    @product = Product.joins("left JOIN ratings ON ratings.product_id = products.id
      left JOIN product_images ON product_images.product_id = products.id
      left JOIN brands ON brands.id = products.brand_id
      left JOIN categories ON categories.id = products.category_id")
    .select('products.id, products.name, products.price, products.serial, products.height,
       brands.name as brand_name, categories.name as category_name,
     ifnull(DATEDIFF(Now(), products.created_at),0) as new, products.detail, products.created_at,
      IFNULL(products.sale_off,0) as sale, product_images.id as image_id,
      product_images.image, avg(ratings.rating) as rating').find(params[:id])

    @rating = Rating.find_by_account_id(session[:id])
    # binding.pry
    # return false
  end

  def new
    @product  = Product.new
  end

  # POST /products
  # POST /products.json
  def create
    #render json: params
  end

  def categories_list
    @products = Product.joins("left JOIN ratings ON ratings.product_id = products.id
      left JOIN product_images ON product_images.product_id = products.id")
    .select('products.id, products.name, products.price, DATEDIFF(Now(), products.created_at) as new,
      IFNULL(products.sale_off,0) as sale, product_images.id as image_id,
      product_images.image, avg(ratings.rating) as rating')
    .where('products.is_delete =0 and products.category_id = ?', params[:product_id])
    .group('products.id').order("products.id DESC").page(params[:page]).per_page(12)
    render 'index'
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :serial, :height, :detail, :price, :sale_off, :quantity, :discount, :is_delete, :brand_id, :category_id)
  end

  def products_layout
    if action_name == 'index'
      "public"
    else
      "product"
    end
  end
end
