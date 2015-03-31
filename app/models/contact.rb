class Contact < ActiveRecord::Base

	validates_format_of :mail, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates :name, presence: true, length: { minimum: 1 }

	before_save :default_values

	def default_values
		self.is_delete = "false" if self.is_delete.nil?
	end
end
