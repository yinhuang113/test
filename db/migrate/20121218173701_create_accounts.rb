class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :status_value

      t.timestamps
    end
    add_index :accounts, :status_value
  end
end
