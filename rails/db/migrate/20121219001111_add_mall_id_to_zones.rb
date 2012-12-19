class AddMallIdToZones < ActiveRecord::Migration
  def change
    add_column :zones, :mall_id, :integer
    add_index :zones, :mall_id
  end
end
