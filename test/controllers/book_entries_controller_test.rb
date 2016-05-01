require 'test_helper'

class BookEntriesControllerTest < ActionController::TestCase
  setup do
    @book_entry = book_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:book_entries)
    assert_select 'table.ui.table'
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_select 'form.ui.form'
  end

  test "should create book_entry" do
    assert_difference('BookEntry.count') do
      post :create, book_entry: { amount: @book_entry.amount, description: @book_entry.description, category_ids: [categories(:one).id], account_id: accounts(:one).id}
    end
    assert_redirected_to book_entry_path(assigns(:book_entry))
    assert_includes assigns(:book_entry).categories, categories(:one)
    assert_equal accounts(:one), assigns(:book_entry).account
  end

  test "should show book_entry" do
    get :show, id: @book_entry
    assert_response :success
  end

  # Hint: f.collection_check_boxes
  test "should get edit" do
    get :edit, id: @book_entry
    assert_response :success
    assert_select '.field' do
      assert_select 'label[for="book_entry_category_ids"]', "Categories"
      assert_select 'input[name="book_entry[category_ids][]"]'
    end
  end

  test "should update book_entry" do
    patch :update, id: @book_entry, book_entry: { amount: @book_entry.amount, description: @book_entry.description }
    assert_redirected_to book_entry_path(assigns(:book_entry))
  end

  test "should destroy book_entry" do
    assert_difference('BookEntry.count', -1) do
      delete :destroy, id: @book_entry
    end

    assert_redirected_to book_entries_path
  end

  test "shouldn't update book_entry without a description" do
    patch :update, id: @book_entry, book_entry: { amount: @book_entry.amount, description: nil }
    assert_response :success
    assert_select "#error_explanation > h2", "1 error prohibited this Book entry from being saved:"
    assert_select "li", "Description can't be blank"
  end

  test "shouldn't create without amount" do
    post :create, book_entry: { amount: 23, description: nil }
    assert_response :success
    assert_select "#error_explanation > h2", "1 error prohibited this Book entry from being saved:"
    assert_select "li", "Description can't be blank"
  end

  test "it stores the categories" do
    patch :update, id: @book_entry, book_entry: {amount: @book_entry.amount, description: @book_entry.description, category_ids: [categories(:one).id]}
    assert_redirected_to book_entry_path(assigns(:book_entry))
    assert_equal [categories(:one).name], assigns(:book_entry).categories.pluck(:name)
  end

end
