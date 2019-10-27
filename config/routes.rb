Rails.application.routes.draw do
  root 'managers#login'
  get 'staffs/index'
  get 'staffs/request_medicine'
  get 'staffs/dispense_medicine'
  get 'staffs/upload_medicine'
  get 'staff_home' => 'staffs#index'
  get 'request_medicine' => 'staffs#request_medicine'
  post '/staffs/request_medicine' => 'staffs#update_ord_history'
  get 'dispense_medicine' => 'staffs#dispense_medicine'
  post '/staffs/dispense_medicine' => 'staffs#add_dispense_medicine'
  get 'upload_medicine' => 'staffs#upload_medicine'
  post '/staffs/upload_medicine' => 'staffs#add_upload_medicine'
  # patch '/staffs/request_medicine'=>'staffs#upload_medicine',as: 'orders_path'
  get '/login', to: 'managers#login'
  post '/', to: 'managers#login_verify'
  get '/manager_index', to: 'managers#manager_index'
  get '/add_staff', to: 'managers#add_staff'
  post '/add_staff', to: 'managers#add_staffs'
  delete '/logoutmanager', to: 'managers#destroy'
  get '/view_staff', to: 'managers#view_staff'
  delete '/delete_staff/:id', to: 'managers#delete_staff'
  get '/view_request_medicine', to: 'managers#view_request_medicine'
  get '/medicine_analyse', to: 'managers#medicine_analyse'
  post '/medicine_analyse', to: 'managers#medicine_analyse_post'
  get '/view_medicine_details', to: 'managers#view_medicine_details' 
  get '/medicine_analyse_post', to: 'managers#medicine_analyse_post'
  get '/remaining_medicine', to: 'managers#remaining_medicine' 
end
