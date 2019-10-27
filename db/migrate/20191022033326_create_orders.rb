class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :ord_id
      t.string :staff_id
      t.string :med_name
      t.integer :quantity
      t.integer :billing_price
      t.date :expiry_date
      t.date :billing_date

      t.timestamps
    end
  end
end
