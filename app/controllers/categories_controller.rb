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
  def delete
    @category = Category.find(params[:id])
    @article = @category.articles.find(params[article_ids])
    @category.destroy
    redirect_to category_path(@category), status: :see_other
  end

  def category_params
    params.require(:category).permit(:id, :title, :description,article_ids:[])
  end


end
