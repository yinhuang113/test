class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tilte, :string, null: false, default: ""
    add_column :users, :first_name, :string, null: false, default: ""
    add_column :users, :last_name, :string, null: false, default: ""
    add_column :users, :role_value, :integer, null: false, default: 0
    add_column :users, :account_id, :integer
    add_index :users, :account_id
  end
end
