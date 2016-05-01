require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  # Hint: ("%.2f EUR" % (book_entries.sum(:amount) / 100.0)).gsub '.', ','
  test 'sums the amount of all entries' do
    category = categories(:sum)
    assert_respond_to category, :entries_sum
    assert_equal "22,22 EUR", category.entries_sum
  end
end
