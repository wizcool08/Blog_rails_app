require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username: 'Kim', email: 'kim@example.com',
                        password: 'password', is_admin: true)
  end 

  test 'get new category form and create category' do
    sign_in_as(@user, 'password')
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: { name: 'sports' } }
      follow_redirect!
    end
    assert_template 'categories/index'
    assert_match 'sports', response.body
  end

  test 'invalid category submission results in redirect to new page' do
    sign_in_as(@user, 'password')
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      post categories_path, params: { category: { name: ' ' } }
    end
    assert_template 'categories/new'
    assert_select 'h2.panel-title'
  end
end