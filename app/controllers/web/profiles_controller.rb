# frozen_string_literal: true

module Web
  class ProfilesController < ApplicationController
    before_action :authenticate_user!
    def index
      @q = Bulletin.where(user: current_user).ransack(params[:q])
      @bulletins = @q.result(distinct: true).page(params[:page])
    end
  end
end
