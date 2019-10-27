class CreateConsumptionHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :consumption_histories do |t|
      t.string :staff_id
      t.string :patient_name
      t.string :med_name
      t.integer :quantity
      t.date :dispensing_date

      t.timestamps
    end
  end
end
