class CreateConnectorLocations < ActiveRecord::Migration
  def change
    create_table :connector_locations do |t|
      t.belongs_to :floor
      t.belongs_to :connector
      t.point :location

      t.timestamps
    end
    add_index :connector_locations, :floor_id
    add_index :connector_locations, :connector_id
  end
end
