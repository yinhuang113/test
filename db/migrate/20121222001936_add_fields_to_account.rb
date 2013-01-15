class AddFieldsToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :address1, :string
    add_column :accounts, :address2, :string
    add_column :accounts, :city, :string, null: false, default: ""
    add_column :accounts, :state, :string, null: false, default: ""
    add_column :accounts, :zipcode, :string
    add_column :accounts, :email, :string
    add_column :accounts, :phone, :string
    add_column :accounts, :website, :string
  end
end
