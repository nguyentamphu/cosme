require 'test_helper'

class OrdersDetailsControllerTest < ActionController::TestCase
  setup do
    @orders_detail = orders_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create orders_detail" do
    assert_difference('OrdersDetail.count') do
      post :create, orders_detail: { is_delete: @orders_detail.is_delete, price: @orders_detail.price, quantity: @orders_detail.quantity }
    end

    assert_redirected_to orders_detail_path(assigns(:orders_detail))
  end

  test "should show orders_detail" do
    get :show, id: @orders_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @orders_detail
    assert_response :success
  end

  test "should update orders_detail" do
    patch :update, id: @orders_detail, orders_detail: { is_delete: @orders_detail.is_delete, price: @orders_detail.price, quantity: @orders_detail.quantity }
    assert_redirected_to orders_detail_path(assigns(:orders_detail))
  end

  test "should destroy orders_detail" do
    assert_difference('OrdersDetail.count', -1) do
      delete :destroy, id: @orders_detail
    end

    assert_redirected_to orders_details_path
  end
end
