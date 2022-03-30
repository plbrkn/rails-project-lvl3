# frozen_string_literal: true

module Web
  class UsersController < ApplicationController
    def new
      @user = User.new
    end

    def create
      @user = User.new(params[:user_sign_up_form])

      if @user.save
        sign_in @user

        redirect_to root_path
      else
        render :new
      end
    end
  end
end