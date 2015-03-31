class Category < ActiveRecord::Base

	before_save :set_isdelete

	def set_isdelete
		self.is_delete = "false" if self.is_delete.nil?
	end
  has_many :products

end
