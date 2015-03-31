class Banner < ActiveRecord::Base

	before_save :default_values

	def default_values
		self.is_delete = "false" if self.is_delete.nil?
	end
	mount_uploader :image, ImageUploader
end
