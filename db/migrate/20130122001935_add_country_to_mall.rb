class AddCountryToMall < ActiveRecord::Migration
  def change
    add_column :malls, :country, :string, null: false, default: ""
  end
end
