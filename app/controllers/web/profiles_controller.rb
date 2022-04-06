# frozen_string_literal: true

module Web
  class ProfilesController < ApplicationController
    def index
      @bulletins = Bulletin.where(user: current_user)
    end
  end
end
