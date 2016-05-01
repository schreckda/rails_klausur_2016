require 'test_helper'

class AccountsControllerTest < ActionController::TestCase
  setup do
    @account = accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create account" do
    assert_difference('Account.count') do
      post :create, account: { balance: @account.balance, user_id: @account.user_id }
    end

    assert_redirected_to accounts_path
  end

  test "should show account" do
    get :show, id: @account
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @account
    assert_response :success
  end

  test "should update account" do
    patch :update, id: @account, account: { balance: @account.balance, user_id: @account.user_id }
    assert_redirected_to account_path(assigns(:account))
  end

  test "should destroy account" do
    assert_difference('Account.count', -1) do
      delete :destroy, id: @account
    end

    assert_redirected_to accounts_path
  end

  test "shouldn't update account without a user" do
    patch :update, id: @account, account: { balance: @account.balance, user_id: nil }
    assert_response :success
    assert_select "#error_explanation > h2", "1 error prohibited this account from being saved:"
    assert_select "li", "User can't be blank"
  end

  test "shouldn't create without user" do
    post :create, account: { balance: @account.balance, user_id: nil }
    assert_response :success
    assert_select "#error_explanation > h2", "1 error prohibited this account from being saved:"
    assert_select "li", "User can't be blank"
  end

end
