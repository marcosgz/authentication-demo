require 'test_helper'

class PostTest < ActiveSupport::TestCase
  context "Post instance" do
    should_validate_presence_of :body, :title
  end
end
