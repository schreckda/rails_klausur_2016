require 'test_helper'

class BookEntryTest < ActiveSupport::TestCase
  test "amount cant be negative" do
    book_entry = BookEntry.new amount: -20,
                               description: "empty"
    refute book_entry.valid?, "numericality validation not missing!"
    assert_equal({amount: ["must be greater than 0"]}, book_entry.errors.messages)
  end

  test "has method euro that returns the amount in EUR" do
    book_entry = BookEntry.new amount: 444,
                               description: "empty"
    assert_respond_to book_entry, :euro
    assert_equal "4,44 EUR", book_entry.euro
  end

  test "has an after_create callback to handle category assignment" do
    entry = book_entries(:two)
    assert_respond_to entry, :assign_to_categories
  end

  test "Assigns the matching categories based on the category during creation" do
    category = Category.create name: "Entries matching abcd",
                               expression: "abcd"
    assert_equal [category], BookEntry.create(amount: 1, description: "abcd").categories
  end

  test "Assigns the matching categories based on the category during update" do
    category = Category.create name: "Entries matching abcd",
                               expression: "abcd"
    entry = book_entries(:one)
    entry.update description: 'abcd'
    assert_equal [category], entry.categories
  end
end
