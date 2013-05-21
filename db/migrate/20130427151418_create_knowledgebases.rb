class CreateKnowledgebases < ActiveRecord::Migration
  def change
    create_table :knowledgebases do |t|
      t.string :topic
      t.string :product
      t.string :software
      t.text :description
      t.string :videos
      t.string :screen_shots
      t.string :related_tickets
      t.string :companies
      t.string :author
      t.string :edits
      t.string :related_articles
      t.text :notes
      t.string :related_devices
      t.string :date_created

      t.timestamps
    end
  end
end
