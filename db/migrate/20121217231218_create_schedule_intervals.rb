class CreateScheduleIntervals < ActiveRecord::Migration
  def change
    create_table :schedule_intervals do |t|
      t.integer :schedule_id
      t.integer :day
      t.string  :name
      t.integer :open_time
      t.integer :close_time

      t.timestamps
    end
    
    add_index :schedule_intervals, :schedule_id
  end
end
