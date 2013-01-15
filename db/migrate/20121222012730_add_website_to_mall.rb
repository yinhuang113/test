class AddWebsiteToMall < ActiveRecord::Migration
  def change
    add_column :malls, :website, :string
  end
end
