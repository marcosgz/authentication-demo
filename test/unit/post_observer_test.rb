require 'test_helper'

class PostObserverTest < ActiveSupport::TestCase

  context "PostObserver on :create" do

    should "create log logged_out" do
      User.current_user = nil
      assert_difference "Log.count", 1 do
        Factory(:post)
      end

      assert_equal(0, Log.last.user_id)
    end

    should "create log logged_in" do
      User.current_user = @user = Factory(:user)
      assert_difference "Log.count", 1 do
        Factory(:post)
      end

      assert_equal(@user.id, Log.last.user_id)
    end
  end

  context "PostObserver on :update" do
    setup do
      @post = Factory(:post)
    end

    should "create log logged_out" do
      User.current_user = nil
      assert_difference "Log.count", 1 do
        @post.update_attribute(:body, 'New body')
      end

      assert_equal(0, Log.last.user_id)
    end

    should "create log logged_in" do
      User.current_user = @user = Factory(:user)
      assert_difference "Log.count", 1 do
        @post.update_attribute(:body, 'New body')
      end

      assert_equal(@user.id, Log.last.user_id)
    end
  end
  
end
