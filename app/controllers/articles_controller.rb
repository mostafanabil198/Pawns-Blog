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

  def show
    @article = Article.find(params[:id])
  end

  def article_parameters
    params.require(:article).permit(:title, :description)
  end
end
