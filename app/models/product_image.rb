class ProductImage < ActiveRecord::Base
  belongs_to :product
  before_save :default_values

  mount_uploader :image , ImageUploader
    def default_values
      self.is_delete = "false" if self.is_delete.nil?
    end
end
