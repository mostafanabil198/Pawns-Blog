class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :destroy, :update, :show]

  def new
    redirect_to article_path if !logged_in?
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
    redirect_to article_path if !logged_in? || current_user != Article.find(params[:id]).user
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
    @articles = Article.paginate(page: params[:page], per_page: 10)
  end

  def destroy
    redirect_to article_path if !logged_in? || current_user != Article.find(params[:id]).user
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
