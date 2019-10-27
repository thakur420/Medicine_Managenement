class DropMedicinesTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :medicines
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
