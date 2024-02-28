class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @category = Category.find(params[:category_id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.images.attach(params[:images])
    @article.user_id = current_user.id

    if @article.save

      redirect_to category_article_path(category_id: params[:article][:category_ids].compact_blank.first,
                                        id: @article.id)
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
      redirect_to category_article_path, status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to category_path(params[:category_id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, images: [], category_ids: [])
  end
end
