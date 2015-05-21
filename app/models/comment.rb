# class Comment < ActiveRecord::Base
# 	belongs_to :acount
# 	belongs_to :product
# 	before_save :default_value
# 	def default_value 
# 		self.is_delete = 'false' if self.is_delete.nil?
# 	end
# end
