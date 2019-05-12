class CategoriesController < ApplicationController
  def categories
    @categories = Categories.all
  end

  def new
    @category = Categories.new
    #@category.build_course
  end

  def create
    @category = Categories.new(category_params)

    if @category.save
      redirect_to @category
    else
      render 'new'
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :cat_name
    )
  end
end
