class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :mall_id, null: false
      t.integer :priority, null: false, default: 0
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      
      t.timestamps
    end
    
    add_index :schedules, :mall_id
    add_index :schedules, :start_date
    add_index :schedules, :end_date
  end
end
