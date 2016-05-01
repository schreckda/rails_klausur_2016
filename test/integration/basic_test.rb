require 'test_helper'

class BasicTest < ActionDispatch::IntegrationTest
  test "the root_path" do
    get root_path
    assert_instance_of CategoriesController, @controller
    assert_equal 'index', @controller.action_name
  end

  test "the basic layout" do
    get root_path
    assert_response :ok
    assert_select 'body > nav.ui.menu > a.item', "Home"
    assert_select 'body > main.ui.page.grid > .row > .column'
  end
end
