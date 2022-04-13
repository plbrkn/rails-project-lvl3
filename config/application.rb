# frozen_string_literal: true

require_relative 'boot'

ENV['RANSACK_FORM_BUILDER'] = '::SimpleForm::FormBuilder'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BulletinBoard
  class Application < Rails::Application
    config.load_defaults 6.1
  end
end
