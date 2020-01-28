class AddExtraColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :link_image, :string, :null => true
    add_column :users, :gender, :string, :null => true
    add_column :users, :date_of_birth, :date, :null => true
  end
end
