class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with name: ENV["USERNAME_AUTH"],
                               password: ENV["PASSWORD_AUTH"],
                               if: -> { ENV["PASSWORD_AUTH"].present? }

def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end
end