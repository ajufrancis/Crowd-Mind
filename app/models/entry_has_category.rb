class EntryHasCategory < ActiveRecord::Base
  attr_accessible :category_id, :entry_id
  belongs_to :entry
  belongs_to :category
end
