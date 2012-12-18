class AddAccountIdToMall < ActiveRecord::Migration
  def change
    add_column :malls, :account_id, :integer
    add_index :malls, :account_id
  end
end
