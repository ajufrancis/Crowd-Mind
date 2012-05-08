class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :entry_has_categories
  has_many :entries, through: :entry_has_categories
end
