class CreateBookEntries < ActiveRecord::Migration
  def change
    create_table :book_entries do |t|
      t.text :description
      t.integer :amount
      t.belongs_to :account, index: true, foreign_key: true

      t.timestamps null: false
    end

    create_join_table :book_entries, :categories
  end
end
