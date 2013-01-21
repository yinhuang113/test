class AddStatusToMall < ActiveRecord::Migration
  def change
    add_column :malls, :status, :string, null: false, default: "new"
  end
end
