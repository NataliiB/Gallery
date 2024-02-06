class CategoriesController < ApplicationController
  def index
      @categories = Category.all
  end

  def show
      @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id

    if @category.save
      redirect_to @category
    else
      render :new, status: :unprocessable_entity
    end
  end

  def category_params
    params.require(:category).permit(:title, :description)
  end

end
