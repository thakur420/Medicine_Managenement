class CreateMedicines < ActiveRecord::Migration[6.0]
  def change
    create_table :medicines do |t|
      t.string :med_name
      t.string :staff_id
      t.integer :quantity
      t.integer :min_quantity

      t.timestamps
    end
  end
end
