require "application_system_test_case"

class MenuListsTest < ApplicationSystemTestCase
  setup do
    @menu_list = menu_lists(:one)
  end

  test "visiting the index" do
    visit menu_lists_url
    assert_selector "h1", text: "Menu Lists"
  end

  test "creating a Menu list" do
    visit menu_lists_url
    click_on "New Menu List"

    fill_in "Menu description", with: @menu_list.menu_description
    fill_in "Menu", with: @menu_list.menu_id
    fill_in "Menu name", with: @menu_list.menu_name
    fill_in "Menu price", with: @menu_list.menu_price
    click_on "Create Menu list"

    assert_text "Menu list was successfully created"
    click_on "Back"
  end

  test "updating a Menu list" do
    visit menu_lists_url
    click_on "Edit", match: :first

    fill_in "Menu description", with: @menu_list.menu_description
    fill_in "Menu", with: @menu_list.menu_id
    fill_in "Menu name", with: @menu_list.menu_name
    fill_in "Menu price", with: @menu_list.menu_price
    click_on "Update Menu list"

    assert_text "Menu list was successfully updated"
    click_on "Back"
  end

  test "destroying a Menu list" do
    visit menu_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Menu list was successfully destroyed"
  end
end
