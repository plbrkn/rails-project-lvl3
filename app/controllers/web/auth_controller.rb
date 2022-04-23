# frozen_string_literal: true

module Web
  class AuthController < ApplicationController
    def callback
      Rails.logger.debug auth_hash
      @user = User.find_or_create_by(email: auth_hash.info.email.downcase)
      sign_in(@user)
      redirect_to root_path, notice: t('notice.welcome')
    rescue ActiveRecord::RecordInvalid
      redirect_to root_path, notice: t('notice.fail')
    end

    def logout
      sign_out
      redirect_to root_path, notice: t('notice.goodbye')
    end

    private

    def auth_hash
      request.env['omniauth.auth']
    end
  end
end
