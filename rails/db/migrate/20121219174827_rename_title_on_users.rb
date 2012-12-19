class RenameTitleOnUsers < ActiveRecord::Migration
  def change
    rename_column :users, :tilte, :title
  end
end
