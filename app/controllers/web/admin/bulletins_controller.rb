# frozen_string_literal: true

module Web
  module Admin
    class BulletinsController < ApplicationController
      def index
        @q = Bulletin.all.order(created_at: :desc).ransack(params[:q])
        @bulletins = @q.result(distinct: true).page(params[:page])
      end

      def archive
        bulletin = Bulletin.find(params[:id])
        if bulletin.may_archive?
          bulletin.archive!
          redirect_to admin_bulletins_path, notice: 'Bulletin archived'
        else
          render :index, status: :unprocessable_entity
        end
      end

      def publish
        bulletin = Bulletin.find(params[:id])

        if bulletin.may_publish?
          bulletin.publish!
          redirect_to admin_bulletins_path, notice: 'Bulletin published'
        else
          render :index, status: :unprocessable_entity
        end
      end

      def reject
        bulletin = Bulletin.find(params[:id])
        if bulletin.may_reject?
          bulletin.reject!
          redirect_to admin_bulletins_path, notice: 'Bulletin rejected'
        else
          render :index, status: :unprocessable_entity
        end
      end
    end
  end
end
