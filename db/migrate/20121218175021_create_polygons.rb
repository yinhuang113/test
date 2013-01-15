class CreatePolygons < ActiveRecord::Migration
  def change
    create_table :polygons do |t|
      t.belongs_to :floor, null: false
      t.string :label
      t.column :vertices, 'polygon', null: false

      t.timestamps
    end
    add_index :polygons, :floor_id
  end
end
