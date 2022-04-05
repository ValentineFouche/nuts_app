class DropListsTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :lists
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
