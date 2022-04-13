class AddColumnsToRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :friend, :string
    add_column :restaurants, :comment, :text
    add_column :restaurants, :searched, :boolean
    add_column :restaurants, :viewed, :boolean
    add_column :restaurants, :feedback_content, :text
    add_column :restaurants, :feedback_rating, :integer
    add_reference :restaurants, :user, foreign_key: true
  end
end
