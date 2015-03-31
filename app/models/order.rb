class Order < ActiveRecord::Base

	has_many :orders_details
	belongs_to :account

     def self.search(search)
	  if search.blank?
	  	Order.joins(:account).where("is_delete= '0' and active_status= '1' and pay_status= '1' and ship_status= '1'")
	  else
	  	Order.joins(:account).where("is_delete= '0' and active_status= '1'
       		and pay_status= '1' and orders.account_id = accounts.id 
       		and ship_status= '1' and accounts.full_name LIKE '%#{search}%' 
       		or orders.id LIKE '%#{search}%' ")
	  end
	end	 
end
