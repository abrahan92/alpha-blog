require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: 'test', email: 'test@gmail.com', password: '123456', admin: true)
    @category = Category.create(name: 'sports')
    @category2 = Category.create(name: 'programming')
  end

  test 'should show categories listing' do
    get categories_path
    assert_template 'categories/index'
    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
  end
end