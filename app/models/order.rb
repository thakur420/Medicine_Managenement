class Order < ApplicationRecord
	validates :ord_id, presence: true
	validates :med_name, presence: true
	validates :quantity, presence: true
	validates :billing_price, presence: true
	validates :expiry_date, presence: true
	validates :billing_date, presence: true

	def name_not_equal_to_select?
  		if med_name.downcase == 'select'
    		errors.add :med_name, " can't be blank"
  		end
	end
end
