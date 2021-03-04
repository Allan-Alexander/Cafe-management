require "test_helper"

class MenuListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @menu_list = menu_lists(:one)
  end

  test "should get index" do
    get menu_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_menu_list_url
    assert_response :success
  end

  test "should create menu_list" do
    assert_difference('MenuList.count') do
      post menu_lists_url, params: { menu_list: { menu_description: @menu_list.menu_description, menu_id: @menu_list.menu_id, menu_name: @menu_list.menu_name, menu_price: @menu_list.menu_price } }
    end

    assert_redirected_to menu_list_url(MenuList.last)
  end

  test "should show menu_list" do
    get menu_list_url(@menu_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_menu_list_url(@menu_list)
    assert_response :success
  end

  test "should update menu_list" do
    patch menu_list_url(@menu_list), params: { menu_list: { menu_description: @menu_list.menu_description, menu_id: @menu_list.menu_id, menu_name: @menu_list.menu_name, menu_price: @menu_list.menu_price } }
    assert_redirected_to menu_list_url(@menu_list)
  end

  test "should destroy menu_list" do
    assert_difference('MenuList.count', -1) do
      delete menu_list_url(@menu_list)
    end

    assert_redirected_to menu_lists_url
  end
end
