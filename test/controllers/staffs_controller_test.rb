require 'test_helper'

class StaffsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get staffs_index_url
    assert_response :success
  end

  test "should get request_medicine" do
    get staffs_request_medicine_url
    assert_response :success
  end

  test "should get dispense_medicine" do
    get staffs_dispense_medicine_url
    assert_response :success
  end

  test "should get upload_medicine" do
    get staffs_upload_medicine_url
    assert_response :success
  end

end
