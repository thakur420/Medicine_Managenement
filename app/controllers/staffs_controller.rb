class StaffsController < ApplicationController
  before_action :logged_in_user, only: [:index,:request_medicine,:upload_medicine,:dispense_medicine]
  def index
  end

  def request_medicine
    @order = OrderHistory.new
  end
  
  def update_ord_history 
    @order = OrderHistory.new(order_history_params)
    @order[:staff_id] = current_user["id"].to_s
    # debugger
    if @order.save
      flash[:success] = "order sent to the manager"
      redirect_to staff_home_path
    else
      render 'request_medicine'
    end
  end

  def upload_medicine
  	@order = Order.new
  end

  def add_upload_medicine
    @order = Order.new(order_params)
    @order[:staff_id] = current_user["id"].to_s
    @medicine = Medicine.find_by(med_name: order_params[:med_name])
    if @medicine
      @medicine[:quantity] += order_params[:quantity].to_i
    else
      @medicine = Medicine.new(med_name: order_params[:med_name],quantity: order_params[:quantity],
                                min_quantity: 10,staff_id: current_user["id"].to_s)
    end
    if @order.save && @medicine.save
      flash[:success] = "order_history updated and medicine added into system"
      redirect_to staff_home_path
    else
      render 'upload_medicine'
    end
  end

  def dispense_medicine
    @consumption = ConsumptionHistory.new
  end

  def add_dispense_medicine
    @consumption = ConsumptionHistory.new(consumption_history_params)
    @consumption[:staff_id] = current_user["id"].to_s
    if @consumption.valid?
      @medicine = Medicine.find_by(med_name: @consumption[:med_name])
      if @medicine[:quantity] - @consumption[:quantity].to_i > @medicine[:min_quantity]
        @medicine[:quantity] -= @consumption[:quantity].to_i
        if @consumption.save && @medicine.save
          flash[:success] = "consumption_history is updated"
          redirect_to staff_home_path
        else
          render 'dispense_medicine'
        end
      else
        flash[:danger] = "medicine out of stock"
         render 'dispense_medicine'
      end
    else
      render 'dispense_medicine'
    end
  end

  def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to '/'
      end
  end
  
private
    def order_params
      params.require(:order).permit(:ord_id, :staff_id, :med_name,:quantity, :billing_price,:expiry_date,:billing_date)
    end
    
    def order_history_params
      params.require(:order_history).permit(:med_name,:quantity, :staff_id)
    end
    
    def consumption_history_params
      params.require(:consumption_history).permit(:patient_name,:staff_id,:med_name,:quantity, :dispensing_date)
    end
end
