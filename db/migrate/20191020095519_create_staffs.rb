class CreateStaffs < ActiveRecord::Migration[6.0]
  def change
    create_table :staffs do |t|
      t.string :staff_name
      t.string :email
      t.string :mobile_no
      t.string :aadhar_no
      t.string :password
      t.timestamps
    end
  end
end
