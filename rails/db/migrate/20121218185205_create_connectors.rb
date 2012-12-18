class CreateConnectors < ActiveRecord::Migration
  def change
    create_table :connectors do |t|
      t.belongs_to :mall
      t.references :connector_type

      t.timestamps
    end
    add_index :connectors, :mall_id
    add_index :connectors, :connector_type_id
  end
end
