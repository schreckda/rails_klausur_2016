require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
    assert_select 'table.ui.table'
    assert_select 'a.ui.black.button[href="'+new_category_path+'"]', "New Category"
    assert_select 'a.ui.green.button[href="'+new_book_entry_path+'"]', "New Book Entry"
  end

  test "index lists all book_entry below respective category" do
    @category.book_entries << book_entries(:one)
    get :index
    assert_select "tr[data-category-id=\"#{@category.id}\"]" do
      assert_select "td", ""
      assert_select "td[colspan='5']" do
        @category.book_entries.each do |book_entry|
          assert_select "p > span.ui.label", book_entry.euro
          assert_select "p > i", book_entry.description
        end
      end
    end
  end

  # Hint: @book_entries_without_category = BookEntry.includes(:categories).where(categories: {id: nil})
  test "show book_entries without category at the end" do
    book_entries(:two).update category_ids: [categories(:two).id]
    book_entry = book_entries(:one)
    get :index
    assert_equal [book_entry], assigns(:book_entries_without_category)
    assert_select "tr" do
      assert_select "td"
      assert_select "td[colspan='5'] > p > span.ui.label", book_entry.euro
      assert_select "td > p > i", book_entry.description
    end
  end

  test "shows the sum of all book_entries for each category" do
    get :index
    Category.all.each do |category|
      assert_select "tr > td > .ui.label", category.entries_sum
    end
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_select 'form.ui.form'
  end

  test "should create category" do
    assert_difference('Category.count') do
      post :create, category: { description: @category.description, expression: @category.expression, name: @category.name }
    end

    assert_redirected_to category_path(assigns(:category))
  end

  test "should show category" do
    get :show, id: @category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @category
    assert_response :success
  end

  test "should update category" do
    patch :update, id: @category, category: { description: @category.description, expression: @category.expression, name: @category.name }
    assert_redirected_to category_path(assigns(:category))
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete :destroy, id: @category
    end

    assert_redirected_to categories_path
  end

  test "shouldn't update categories without a name" do
    patch :update, id: @category, category: { description: @category.description, expression: @category.expression, name: nil }
    assert_response :success
    assert_select "#error_explanation > h2", "1 error prohibited this category from being saved:"
    assert_select "li", "Name can't be blank"
  end

  test "shouldn't categories without name" do
    post :create, category: { description: @category.description, expression: @category.expression, name: ""}
    assert_response :success
    assert_select "#error_explanation > h2", "1 error prohibited this category from being saved:"
    assert_select "li", "Name can't be blank"
  end

end
