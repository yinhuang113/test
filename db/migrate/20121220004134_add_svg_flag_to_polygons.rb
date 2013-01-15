class AddSvgFlagToPolygons < ActiveRecord::Migration
  def change
    add_column :polygons, :from_svg, :boolean, null: false, default: false
    add_index :polygons, :from_svg
  end
end
