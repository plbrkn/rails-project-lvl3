# frozen_string_literal: true

module Web
  class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :create
    def new; end

    def create
      user = User.find_by(user_params)
      if user&.admin?
        sign_in user
        redirect_to admin_root_path, notice: t('notices.welcome')
      else
        redirect_to new_session_path, notice: t('notices.error')
      end
    end

    def destroy
      sign_out
      redirect_to root_path, notice: t('notices.goodbye')
    end

    def user_params
      params.require(:user).permit(:email)
    end
  end
end
