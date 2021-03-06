require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, :user => { :login=>Factory.next(:login), :password=>'123456', :name=>'Test'}
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, :id => Factory(:user).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => Factory(:user).to_param
    assert_response :success
  end

  test "should update user" do
    put :update, :id => Factory(:user).to_param, :user => { :name => 'Updated' }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    user = Factory(:user)
    assert_difference('User.count', -1) do
      delete :destroy, :id => user.to_param
    end

    assert_redirected_to users_path
  end
end
