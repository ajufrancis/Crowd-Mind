class CreateEntryHasCategories < ActiveRecord::Migration
  def change
    create_table :entry_has_categories do |t|
      t.integer :entry_id
      t.integer :category_id

      t.timestamps
    end
  end
end
