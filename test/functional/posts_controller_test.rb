require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  should "get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  should "show post" do
    get :show, :id => Factory(:post).to_param
    assert_response :success
  end

  context "Logged out" do
    setup do
      sign_out
    end

    context "on GET :new" do
      setup do
        get :new
      end
      should_redirect_to("sign_in_url"){sign_in_url}
    end

    context "on GET :edit" do
      setup do
        get :edit, :id => Factory(:post).to_param
      end
      should_redirect_to("sign_in_url"){sign_in_url}
    end

    context "on POST :create" do

      should "redirect to sign_in" do
        assert_no_difference "Post.count" do
          post :create, :post => { :title=>'Title', :body=>'Body' }
        end
        assert_redirected_to sign_in_url
      end

    end

    context "on PUT :update" do

      setup do
        @post = Factory(:post, :body=>'Body')
      end

      should "redirect to sign_in" do
        put :update, :id => @user.to_param, :post => {:body =>'New Body'}

        assert_equal('Body', @post.reload.body)
        assert_redirected_to sign_in_url
      end

    end

    context "on DELETE :destroy" do
      setup do
        @post = Factory(:post)
      end

      should "not remove post" do
        assert_no_difference "Post.count" do
          delete :destroy, :id => @post.to_param
        end

        assert_redirected_to sign_in_url
      end
    end
    
  end

  context "Logged in" do
    setup do
      sign_in(Factory(:user))
    end

    should "get new" do
      get :new
      assert_response :success
    end

    should "create post" do
      assert_difference('Post.count') do
        post :create, :post => { :title=>'Title', :body=>'Body' }
      end
      assert_redirected_to post_path(assigns(:post))
    end

    should "get edit" do
      get :edit, :id => Factory(:post).to_param
      assert_response :success
    end

    should "update post" do
      put :update, :id => Factory(:post).to_param, :post => {:body =>'New Body'}
      assert_redirected_to post_path(assigns(:post))
    end

    should "destroy post" do
      post = Factory(:post)
      assert_difference('Post.count', -1) do
        delete :destroy, :id => post.to_param
      end

      assert_redirected_to posts_path
    end
  end
end
