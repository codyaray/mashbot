require 'test_helper'

class ServiceAccountsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:service_accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service_account" do
    assert_difference('ServiceAccount.count') do
      post :create, :service_account => { }
    end

    assert_redirected_to service_account_path(assigns(:service_account))
  end

  test "should show service_account" do
    get :show, :id => service_accounts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => service_accounts(:one).to_param
    assert_response :success
  end

  test "should update service_account" do
    put :update, :id => service_accounts(:one).to_param, :service_account => { }
    assert_redirected_to service_account_path(assigns(:service_account))
  end

  test "should destroy service_account" do
    assert_difference('ServiceAccount.count', -1) do
      delete :destroy, :id => service_accounts(:one).to_param
    end

    assert_redirected_to service_accounts_path
  end
end
