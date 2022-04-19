# frozen_string_literal: true

require 'test_helper'

class Web::Admin::CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
    @attrs = {
      name: Faker::Job.title
    }

    sign_in(users(:admin))
  end

  test 'should get index' do
    get admin_categories_url
    assert_response :success
  end

  test 'should get new' do
    get new_admin_category_path
    assert_response :success
  end

  test 'should create category' do
    post admin_categories_path, params: { category: @attrs }

    assert_response :redirect

    assert Category.find_by(name: @attrs[:name])
  end

  test 'should get edit' do
    get edit_admin_category_path @category
    assert_response :success
  end

  test 'should update category' do
    patch admin_category_path @category, params: { category: @attrs }

    assert_response :redirect

    @category.reload
    assert @attrs[:name] == @category.name
  end

  test 'should delete category' do
    delete admin_category_path @category

    assert_response :redirect

    assert_not Category.find_by(id: @category.id)
  end
end
