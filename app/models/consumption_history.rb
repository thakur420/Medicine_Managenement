class ConsumptionHistory < ApplicationRecord
	validates :med_name, presence: true
	validates :patient_name, presence: true
	validates :quantity, presence: true
	validates :dispensing_date, presence: true

end