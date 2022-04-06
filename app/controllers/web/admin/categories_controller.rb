# frozen_string_literal: true

module Web
  module Admin
    class CategoriesController < ApplicationController
      def index
        @categories = Category.all.order(id: :asc)
      end

      def new
        @category = Category.new
      end

      def create
        @category = Category.new(category_params)

        if @category.save
          redirect_to admin_categories_path, notice: 'Category was successfully created.'
        else
          render :new
        end
      end

      def edit
        @category = Category.find(params[:id])
      end

      def update
        @category = Category.find(params[:id])

        if @category.update(category_params)
          redirect_to admin_categories_path, notice: 'Category was successfully updated.'
        else
          render :edit
        end
      end

      def destroy
        @category = Category.find(params[:id])
        @category.destroy

        redirect_to admin_categories_path, notice: 'Category was successfully destroyed.'
      end

      private

      def category_params
        params.require(:category).permit(:name)
      end
    end
  end
end
