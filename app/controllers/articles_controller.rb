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
    @article.image.attach(params[:image])
    #@article.categories.(params[:article][:categories].shift)
    #@article.categories.update!(params[:article][:categories].shift)
    #(:title =>params[:title],:description => params[:description],:categories => params[:article][:categories].shift)

    @article.categories << Category.where(params[:article][:category_ids])
    @article.user_id = current_user.id
    binding.pry
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

  private
  def article_params
    params.require(:article).permit(:title, :description, :image, :category_ids)
  end
end
