class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :destroy, :update, :show]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_parameters)
    @article.user = User.first
    if @article.save
      flash[:notice] = "article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update(article_parameters)
      flash[:notice] = "article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
  end

  def index
    @articles = Article.all
  end

  def destroy
    @article.destroy
    redirect_to articles_path
    flash[:notice] = "article was successfully deleted"
  end


  private
    def article_parameters
      params.require(:article).permit(:title, :description)
    end
    def set_article
        @article = Article.find(params[:id])
    end
end
