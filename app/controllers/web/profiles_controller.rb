# frozen_string_literal: true

module Web
  class ProfilesController < ApplicationController
    def index
      @q = Bulletin.where(user: current_user).ransack(params[:q])
      @bulletins = @q.result(distinct: true)
    end
  end
end
