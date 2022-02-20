# frozen_string_literal: true

module Web
  class BulletinsController < ApplicationController
    def index
      @bulletins = Bulletin.all.order(created_at: :desc)
      Rails.logger.debug signed_in?
    end

    def new
      @bulletin = Bulletin.new
    end

    def create
      @bulletin = current_user.bulletins.build(bulletin_params)

      if @bulletin.save
        redirect_to root_path, notice: 'Success'
      else
        render :new, notice: 'Fail'
      end
    end

    def show
      @bulletin = Bulletin.find(params[:id])
    end

    private

    def bulletin_params
      params.require(:bulletin).permit(:name, :body, :photo, :category_id)
    end
  end
end
