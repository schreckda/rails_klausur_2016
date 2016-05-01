class Category < ActiveRecord::Base
  has_and_belongs_to_many :book_entries
  validates_presence_of :name

  def entries_sum
    ("%.2f EUR" % (book_entries.sum(:amount) / 100.0)).gsub '.', ','
  end
end
