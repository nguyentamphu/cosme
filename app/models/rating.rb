class Rating < ActiveRecord::Base
	belongs_to :product
	belongs_to :account	
	before_save :default_value
	def default_value
		self.is_delete = 'false' if self.is_delete.nil?
	end
end
