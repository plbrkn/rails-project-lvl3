# frozen_string_literal: true

require 'test_helper'

class Web::Admin::BulletinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @under_moderation = bulletins(:under_moderation)

    sign_in(users(:admin))
  end
end
