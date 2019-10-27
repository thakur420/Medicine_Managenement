class CreateOrderHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :order_histories do |t|
      t.string :med_name
      t.integer :quantity
      t.string :staff_id

      t.timestamps
    end
  end
end
