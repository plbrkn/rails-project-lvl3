# frozen_string_literal: true

module AuthConcern
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_admin!
    user_not_authorized unless current_user&.admin?
  end

  def user_not_authorized
    flash[:alert] = t('pundit.default')
    redirect_to(request.referer || root_path)
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session.delete(:user_id)
    session.clear
  end

  def signed_in?
    !current_user.nil?
  end

  def authenticate_user!
    return if signed_in?

    redirect_to new_session_path
  end
end
