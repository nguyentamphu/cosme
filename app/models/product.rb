class Product < ActiveRecord::Base
	before_save :default_values
	  has_many :product_images
	  belongs_to :brand
	  belongs_to :category
	  has_one :orders_detail
	  has_many :ratings

  
    def default_values
      self.is_delete = "false" if self.is_delete.nil?
    end



def self.search(search)
  if search
    Product.joins("left JOIN ratings ON ratings.product_id = products.id 
      left JOIN product_images ON product_images.product_id = products.id")
    .select('products.id, products.name, products.price, DATEDIFF(Now(), products.created_at) as new, 
      IFNULL(products.sale_off,0) as sale, product_images.id as image_id,
      product_images.image, avg(ratings.rating) as rating')
    .where('products.is_delete =0 and products.name like ?', "%#{search}%"  )
  
  else
  	Product.joins("left JOIN ratings ON ratings.product_id = products.id 
      left JOIN product_images ON product_images.product_id = products.id")
    .select('products.id, products.name, products.price, DATEDIFF(Now(), products.created_at) as new, 
      IFNULL(products.sale_off,0) as sale, product_images.id as image_id,
      product_images.image, avg(ratings.rating) as rating').where('products.is_delete =0')
  end
end
end
