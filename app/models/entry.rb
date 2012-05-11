class Entry < ActiveRecord::Base
  attr_accessible :author, :content, :feed_id, :published, :summary, :title, :uid, :url
  belongs_to :feed
  has_many :entry_has_categories
  has_many :categories, through: :entry_has_categories
  validates_uniqueness_of :uid, scope: :feed_id

  def self.parse(f, e)
    entry = Entry.find_by_uid_and_feed_id(e.id, f.id)
    if(entry)
      entry.update_attributes(
                              title: e.title,
                              url: e.url,
                              author: e.author,
                              summary: e.summary,
                              content: e.content,
                              published: e.published,
                              feed_id: f.id
                              )
    else
      entry = Entry.create(
                           title: e.title,
                           url: e.url,
                           author: e.author,
                           summary: e.summary,
                           content: e.content,
                           published: e.published,
                           feed_id: f.id
                           )
    end

    return entry
  end
end
