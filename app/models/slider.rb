class Slider < ActiveRecord::Base
	before_save :default_value
	def default_value
		self.is_delete = 'false' if self.is_delete.nil?
	end
	mount_uploader :image, ImageUploader
end
