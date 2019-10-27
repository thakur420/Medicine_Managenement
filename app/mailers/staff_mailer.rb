class StaffMailer < ApplicationMailer
	default from: 'nitcghrbms@gmail.com'
 
  def welcome_email
    @staff = params[:staff]
    # debugger
    mail(to: @staff.email, subject: 'Check Your Credentials for Medical Inventory Management System')

  end
end
