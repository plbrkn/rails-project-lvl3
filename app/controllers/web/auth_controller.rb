# frozen_string_literal: true

module Web
  class AuthController < ApplicationController
    def callback
      Rails.logger.debug auth_hash
      @user = User.find_or_create_by(email: auth_hash.info.email.downcase)
      session[:user_id] = @user.id
      redirect_to root_path, notice: t('notices.welcome')
    end

    private

    def auth_hash
      request.env['omniauth.auth']
    end
  end
end
