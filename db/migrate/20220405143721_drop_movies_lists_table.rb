class DropMoviesListsTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :movies_lists
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
