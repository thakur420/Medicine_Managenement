class OrderHistory < ApplicationRecord
	validates :med_name, presence: true
	validates :quantity, presence: true
	validate :name_not_equal_to_select?

	def name_not_equal_to_select?
  		if med_name.downcase == 'select'
    		errors.add :med_name, " can't be blank"
  		end
	end
end
