require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not register without an email' do
    user = User.new
    user.email = nil
  end
end
