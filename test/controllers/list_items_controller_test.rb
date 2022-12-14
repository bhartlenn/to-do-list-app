require "test_helper"

class ListItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @list_item = list_items(:one)
  end

  test "should get index" do
    get list_items_url
    assert_response :success
  end

  test "should get new" do
    get new_list_item_url
    assert_response :success
  end

  test "should create list_item" do
    assert_difference("ListItem.count") do
      post list_items_url, params: { list_item: { category_id: @list_item.category_id, details: @list_item.details, due: @list_item.due, name: @list_item.name, status: @list_item.status, user_id: @list_item.user_id } }
    end

    assert_redirected_to list_item_url(ListItem.last)
  end

  test "should show list_item" do
    get list_item_url(@list_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_list_item_url(@list_item)
    assert_response :success
  end

  test "should update list_item" do
    patch list_item_url(@list_item), params: { list_item: { category_id: @list_item.category_id, details: @list_item.details, due: @list_item.due, name: @list_item.name, status: @list_item.status, user_id: @list_item.user_id } }
    assert_redirected_to list_item_url(@list_item)
  end

  test "should destroy list_item" do
    assert_difference("ListItem.count", -1) do
      delete list_item_url(@list_item)
    end

    assert_redirected_to list_items_url
  end
end
