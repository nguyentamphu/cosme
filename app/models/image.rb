class Image < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	rails_admin do
	    visible false # or visible { some block }
	end
end
