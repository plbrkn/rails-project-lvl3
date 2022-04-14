# frozen_string_literal: true

module Web
  class BulletinsController < ApplicationController
    after_action :verify_authorized, except: %i[index show]
    def index
      @q = Bulletin.published.order(created_at: :desc).ransack(params[:q])
      @bulletins = @q.result(distinct: true).page(params[:page])
    end

    def new
      @bulletin = Bulletin.new
      authorize @bulletin
    end

    def create
      authorize Bulletin
      @bulletin = current_user.bulletins.build(bulletin_params)

      if @bulletin.save
        redirect_to root_path, notice: t('notice.bulletin.create')
      else
        render :new, notice: t('notice.fail')
      end
    end

    def show
      @bulletin = Bulletin.find(params[:id])
    end

    def edit
      @bulletin = Bulletin.find(params[:id])
      authorize @bulletin
    end

    def update
      @bulletin = Bulletin.find(params[:id])
      authorize @bulletin

      if @bulletin.update(bulletin_params)
        redirect_to @bulletin, notice: t('notice.bulletin.update')
      else
        render :edit
      end
    end

    def moderate
      bulletin = Bulletin.find(params[:id])

      authorize bulletin

      if bulletin.may_moderate?
        bulletin.moderate!
        redirect_to profile_path, notice: t('notice.bulletin.moderate')
      else
        render :index, status: :unprocessable_entity
      end
    end

    def archive
      bulletin = Bulletin.find(params[:id])

      authorize bulletin

      if bulletin.may_archive?
        bulletin.archive!
        redirect_to profile_path, notice: t('notice.bulletin.archive')
      else
        render :index, status: :unprocessable_entity
      end
    end

    private

    def bulletin_params
      params.require(:bulletin).permit(:title, :description, :photo, :category_id)
    end
  end
end
