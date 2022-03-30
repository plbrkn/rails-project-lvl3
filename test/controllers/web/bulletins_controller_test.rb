# frozen_string_literal: true

require 'test_helper'

class Web::BulletinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attrs = {
      name: Faker::Job.title,
      body: Faker::Lorem.paragraph_by_chars(number: 150),
      category_id: categories(:one).id,
      photo: fixture_file_upload('cat.jpeg', 'image/jpeg')
    }

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

    assert_response :redirect

    assert Bulletin.find_by(name: @attrs[:name])
  end
end
