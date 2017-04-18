class CreateJoinTableCategoryBookEntry < ActiveRecord::Migration
  def change
    create_join_table :categories, :book_entries do |t|
      # t.index [:category_id, :book_entry_id]
      # t.index [:book_entry_id, :category_id]
    end
  end
end
