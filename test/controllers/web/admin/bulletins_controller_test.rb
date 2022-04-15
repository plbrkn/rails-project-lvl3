# frozen_string_literal: true

require 'test_helper'

class Web::Admin::BulletinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @under_moderation = bulletins(:under_moderation)

    sign_in(users(:admin))
  end

  test 'should get index' do
    get admin_bulletins_url
    assert_response :success
  end

  test 'should archive bulletin' do
    patch archive_admin_bulletin_path(@under_moderation)

    assert_response :redirect

    @under_moderation.reload
    assert @under_moderation.archived?
  end

  test 'should publish bulletin' do
    patch publish_admin_bulletin_path(@under_moderation)

    assert_response :redirect

    @under_moderation.reload
    assert @under_moderation.published?
  end

  test 'should reject bulletin' do
    patch reject_admin_bulletin_path(@under_moderation)

    assert_response :redirect

    @under_moderation.reload
    assert @under_moderation.rejected?
  end
end
