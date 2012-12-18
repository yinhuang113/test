class CreateEntrances < ActiveRecord::Migration
  def change
    create_table :entrances do |t|
      t.string :name, null: false, default: ""
      t.belongs_to :floor, null: false
      t.column :location, 'point', null: false

      t.timestamps
    end
    add_index :entrances, :floor_id
  end
end
