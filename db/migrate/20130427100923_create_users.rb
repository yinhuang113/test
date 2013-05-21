class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :contact_id
      t.string :firstName
      t.string :lastName
      t.string :title
      t.string :email,  :null => false, :default => ""
      t.boolean :email_private
      t.string :phone
      t.string :extension
      t.string :fax
      t.string :mobile
      t.string :home_phone
      t.string :company
      t.string :site_city
      t.string :site_zip
      t.string :site_phone
      t.text :notes

      t.timestamps
    end
  end
end
