class Staff < ApplicationRecord
	# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+\.[a-z]+\z/i
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :staff_name, presence: true, length: {maximum: 50}
	validates :email, presence: true,
	 length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX},
	 uniqueness: {case_sensitive: false}
	 validates :mobile_no, presence: true
	 validates :aadhar_no, presence: true
end
