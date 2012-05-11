class Feed < ActiveRecord::Base
  attr_accessible :etag, :feed_url, :last_modified, :title, :url
  has_many :entries
  validates_presence_of :feed_url

  def update_by_feedzirra(f)
    f.sanitize_entries!
    parse(f)

    f.new_entries.each do |entry|
      Entry.parse(self, entry)
    end

    return self
  end

  def initialize_by_feedzirra(f)
    f.sanitize_entries!
    parse(f)

    f.entries.each do |entry|
      Entry.parse(self, entry)
    end

    return self
  end

  private
  def parse(f)
    self.update_attributes(
                           title: f.title,
                           url: f.url,
                           etag: f.etag,
                           last_modified: f.last_modified
                           )
  end
end
