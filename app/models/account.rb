class Account < ActiveRecord::Base
	validates_email_realness_of :email
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates :password , presence: true, length: { minimum: 6 }
	validates :full_name , presence: true, length: { minimum: 1 }
    mount_uploader :image, ImageUploader
	has_many :orders
	has_many :comments
	has_many :ratings

	def gender_enum
	    # Do not select any value, or add any blank field. RailsAdmin will do it for you.
	    {'Male'=>1, 'Female'=>0}
	 end

end

