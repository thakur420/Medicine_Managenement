class CreateManagers < ActiveRecord::Migration[6.0]
  def change
    create_table :managers do |t|
      t.string :manager_name
      t.string :manager_id
      t.string :password
      t.timestamps
    end
  end
end
