class Entry < ActiveRecord::Base
  attr_accessible :author, :content, :feed_id, :published, :summary, :title, :uid, :url
  belongs_to :feed
  has_many :entry_has_categories
  has_many :categories, through: :entry_has_categories
end
