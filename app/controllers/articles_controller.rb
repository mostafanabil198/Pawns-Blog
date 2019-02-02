class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_parameters)
    if @article.save
      flash[:notice] = "article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_parameters)
      flash[:notice] = "article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def article_parameters
    params.require(:article).permit(:title, :description)
  end
end
