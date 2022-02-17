# frozen_string_literal: true

module Web
  class AuthController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :create

    def callback
      @user = User.find_or_create_by(email: auth_hash.info.email.downcase)
      session[:user_id] = @user.id
      redirect_to '/'
    end

    private

    def auth_hash
      request.env['omniauth.auth']
    end
  end
end
