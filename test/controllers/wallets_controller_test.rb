require 'test_helper'

class WalletsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get wallets_edit_url
    assert_response :success
  end

  test "should get show" do
    get wallets_show_url
    assert_response :success
  end

  test "should get update" do
    get wallets_update_url
    assert_response :success
  end

end
