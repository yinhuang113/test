class Knowledgebase < ActiveRecord::Base
  attr_accessible :author, :companies, :date_created, :description, :edits, :notes, :product, :related_articles, :related_devices, :related_tickets, :screen_shots, :software, :topic, :videos
end
