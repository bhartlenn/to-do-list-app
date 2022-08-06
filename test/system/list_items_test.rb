require "application_system_test_case"

class ListItemsTest < ApplicationSystemTestCase
  setup do
    @list_item = list_items(:one)
  end

  test "visiting the index" do
    visit list_items_url
    assert_selector "h1", text: "List items"
  end

  test "should create list item" do
    visit list_items_url
    click_on "New list item"

    fill_in "Category", with: @list_item.category_id
    fill_in "Details", with: @list_item.details
    fill_in "Due", with: @list_item.due
    fill_in "Name", with: @list_item.name
    fill_in "Status", with: @list_item.status
    fill_in "User", with: @list_item.user_id
    click_on "Create List item"

    assert_text "List item was successfully created"
    click_on "Back"
  end

  test "should update List item" do
    visit list_item_url(@list_item)
    click_on "Edit this list item", match: :first

    fill_in "Category", with: @list_item.category_id
    fill_in "Details", with: @list_item.details
    fill_in "Due", with: @list_item.due
    fill_in "Name", with: @list_item.name
    fill_in "Status", with: @list_item.status
    fill_in "User", with: @list_item.user_id
    click_on "Update List item"

    assert_text "List item was successfully updated"
    click_on "Back"
  end

  test "should destroy List item" do
    visit list_item_url(@list_item)
    click_on "Destroy this list item", match: :first

    assert_text "List item was successfully destroyed"
  end
end
