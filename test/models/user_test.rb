require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "all valid user" do
    allUsers = users(:john, :ann)

    allUsers.each do |user|
      assert_not_nil user.id
      assert_not_nil user.first_name
      assert_not_nil user.last_name
      assert_not_nil user.email
    end
  end

  test "should not save user without email" do
    @user.email = nil
    assert_not @user.save
  end

  test "should not save user without password" do
    @user.password_digest = nil
    assert_not @user.save
  end

  test "should not save user with invalid email" do
    @user.email = 'invalidemail'
    assert_not @user.save
  end

  test "user has 2 urls" do
    assert_equal 2, @user.urls.size
  end

  def setup
    @user = users(:john)
  end
end
