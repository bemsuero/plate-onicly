require 'test_helper'

class MeetupsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get meetups_new_url
    assert_response :success
  end

  test "should get edit" do
    get meetups_edit_url
    assert_response :success
  end

  test "should get index" do
    get meetups_index_url
    assert_response :success
  end

  test "should get show" do
    get meetups_show_url
    assert_response :success
  end

end
