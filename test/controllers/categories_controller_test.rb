require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: 'sport')
    @user = User.create(username: 'Kim', email: 'kim@example.com',
      password: 'password', is_admin: true)
  end

  test 'should get categories index' do
    get categories_path
    assert_response :success
  end

  test 'should get new' do
    sign_in_as(@user, 'password')
    get new_category_path
    assert_response :success
  end

  test 'should get show' do
    get category_path(@category)
    assert_response :success
  end
  
end