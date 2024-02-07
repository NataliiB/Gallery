class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end
  def show
    @article = Article.find(params[:id])
  end
  def new

    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.images.attach(params[:images])
    @article.user_id = current_user.id

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def delete
    @article = Article.find(params[:id])
    @category = @article.categories.find(params[category_ids])
    @article.destroy
    redirect_to articles_path, status: :see_other
  end

  private
  def article_params
    params.require(:article).permit(:title, :description, images:[], category_ids: [])
  end
end
