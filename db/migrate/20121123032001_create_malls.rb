class CreateMalls < ActiveRecord::Migration
  def change
    create_table :malls do |t|
      t.string :name
      t.text :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :email
      t.string :phone
      t.float :latitude
      t.float :longitude
      t.string :database

      t.timestamps
    end
  end
end
