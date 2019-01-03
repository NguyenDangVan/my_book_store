class Admin::CategoriesController < ApplicationController
  def index
    if params[:search].present?
      @categories = Category.select_categories.get_by_name params[:search]
    else
      @categories = Category.select_categories
    end
    @categories = @categories.order(:name).page(params[:page]).per Settings.pages.per_category
  end
end
