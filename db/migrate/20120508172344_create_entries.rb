class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.string :url
      t.string :author
      t.string :summary
      t.text :content
      t.string :uid
      t.datetime :published
      t.integer :feed_id

      t.timestamps
    end
  end
end
