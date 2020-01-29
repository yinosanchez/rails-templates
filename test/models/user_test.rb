require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save user without username" do
    user = User.new(username: "", email: "test@test.com", password:"password", role: "")
    assert_not user.save
  end

  test "should not save user without email" do
    user = User.new(username: "tester", email: "", password:"password", role: "")
    assert_not user.save
  end

  test "should not save user without password" do
    user = User.new(username: "tester", email: "test@test.com", password:"", role: "")
    assert_not user.save
  end

  test "should save user if all present" do
    user = User.new(username: "tester", email: "test@test.com", password:"password", role: "")
    assert user.save
  end
end
