class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.integer :polygon_id
      t.references :zone_type
      t.string :label

      t.timestamps
    end
  end
end
