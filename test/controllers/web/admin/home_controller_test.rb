# frozen_string_literal: true

require 'test_helper'

class Web::Admin::HomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in(users(:admin))
  end

  test 'should get index' do
    get admin_root_url
    assert_response :success
  end
end
