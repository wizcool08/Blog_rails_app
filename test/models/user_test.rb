require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(username: 'David Smith', email: 'david_smith_01@gmail.com',
                     password: 'qwer1234', password_confirmation: 'qwer1234')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'username should be present' do
    @user.username = "   "
    assert_not @user.valid?
  end

  test 'username should not exceed 25 chars' do
    @user.username = "a" * 30
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = "   "
    assert_not @user.valid?
  end

  test 'email should not exceed 105 chars' do
    @user.username = 'a' * 200 + '@gmail.com'
    assert_not @user.valid?
  end

  test 'password should be present (nonblank)' do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test 'password should have a minimum length' do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end