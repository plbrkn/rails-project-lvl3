# frozen_string_literal: true

require 'test_helper'

class Web::BulletinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attrs = {
      title: Faker::Job.title,
      description: Faker::Lorem.paragraph_by_chars(number: 150),
      category_id: categories(:one).id,
      image: fixture_file_upload('cat.jpeg', 'image/jpeg')
    }

    @bulletin = bulletins(:one)

    sign_in(users(:one))
  end

  test 'should get index' do
    get root_url
    assert_response :success
  end

  test 'should get new' do
    get new_bulletin_path
    assert_response :success
  end

  test 'should create bulletin' do
    post bulletins_path, params: { bulletin: @attrs }

    assert_redirected_to profile_url

    assert Bulletin.find_by(@attrs.except(:image))
  end

  test 'should update bulletin' do
    patch bulletin_path(@bulletin), params: { bulletin: @attrs }

    assert_response :redirect

    @bulletin.reload
    assert @attrs[:title] == @bulletin.title
  end

  test 'should archive bulletin' do
    patch archive_bulletin_path(@bulletin)

    assert_response :redirect

    @bulletin.reload
    assert @bulletin.archived?
  end

  test 'should moderate bulletin' do
    patch moderate_bulletin_path(@bulletin)

    assert_response :redirect

    @bulletin.reload
    assert @bulletin.under_moderation?
  end
end
