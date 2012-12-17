class CreateFloors < ActiveRecord::Migration
  def change
    create_table :floors do |t|
      t.integer :mall_id
      t.text :svg
      t.string :label
      t.integer :order
      t.boolean :main
      t.string :source_map_file_name

      t.timestamps
    end
    
    add_index :floors, :mall_id
    add_index :floors, [:mall_id, :order], unique: true, order: {order: :asc}
  end
end
