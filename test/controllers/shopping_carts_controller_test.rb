require 'test_helper'

class ShoppingCartsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shopping_carts_index_url
    assert_response :success
  end

  test "should get show" do
    get shopping_carts_show_url
    assert_response :success
  end

end
