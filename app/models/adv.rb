class Adv < ActiveRecord::Base
	def default_values
		self.is_delete = "false" if self.is_delete.nil?
	end
	mount_uploader :image, ImageUploader
end
