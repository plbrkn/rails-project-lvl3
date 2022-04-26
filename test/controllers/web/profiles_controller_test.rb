# frozen_string_literal: true

require 'test_helper'

class Web::ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in(users(:one))
  end

  test 'should get show' do
    get profile_url
    assert_response :success
  end
end
