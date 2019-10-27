class ManagersController < ApplicationController
	before_action :logged_in_user, only: [:add_staff,:manager_index,:view_staff,:delete_staff,:medicine_analyse,:medicine_analyse_post,:remaining_medicine] 
	def login
	end
	
	def manager_index
	end

	def add_staff
		@staff = Staff.new
	end

	def view_staff
		@staff = Staff.all
		#@staff  = Staff.all.paginate(:page => params[:page], :per_page=>5)
		#@staff= @staff_paginator.group_by { |r| r.created_at.to_date }
	end

	def view_request_medicine
		@order_history = OrderHistory.all
	end

	def medicine_analyse
	end

	def remaining_medicine
		@medicine = Medicine.all
	end


	def medicine_analyse_post
		if params[:analyse][:date1].empty?
			@consumption =  ConsumptionHistory.where(med_name: params[:analyse][:med_name])
		elsif params[:analyse][:med_name].empty?
			@consumption =  ConsumptionHistory.where(created_at: params[:analyse][:date1] ..  params[:analyse][:date2])
		else
			@consumption =  ConsumptionHistory.where(created_at: params[:analyse][:date1] ..  params[:analyse][:date2], med_name: params[:analyse][:med_name])
		end
	end

	def login_verify
		manager = Manager.find_by(manager_id: params[:manager][:manager_id], password: params[:manager][:password])
		staff = Staff.find_by(email: params[:manager][:manager_id], password: params[:manager][:password])

		if manager.present?
			log_in(manager)
			redirect_to '/manager_index'
		elsif staff.present?
			log_in(staff)
			redirect_to staff_home_path
		else
			render 'login'
		end
	end

	def add_staffs
		temp = add_staff_params
		random_string = [*('a'..'z'),*('0'..'9')].shuffle[0,8].join
		password = {password: random_string}
		temp.merge!(password)
		@staff = Staff.new(temp)
		if @staff.save
			StaffMailer.with(staff: @staff).welcome_email.deliver_now
			redirect_to '/manager_index'
		else
			render 'add_staff'
		end
	end

	def delete_staff
		@staff = Staff.find_by(params[:id])
		@staff.destroy
		redirect_to '/view_staff'

	end

	def destroy
	    log_out if logged_in?
	    redirect_to '/'
	end

	def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to '/'
      end
    end

	private
		def add_staff_params
			params.require(:staff).permit(:staff_name, :email, :mobile_no, :aadhar_no)
		end
end
