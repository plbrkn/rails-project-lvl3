# frozen_string_literal: true

module Web
  module Admin
    class BulletinsController < ApplicationController
      def index
        @bulletins = Bulletin.all.order(created_at: :desc)
      end

      def archive
        bulletin = Bulletin.find(params[:id])
        pp bulletin
        pp current_user
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
          if bulletin.publish!
            pp 'Happy'
          else
            pp 'Sad'
          end
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
