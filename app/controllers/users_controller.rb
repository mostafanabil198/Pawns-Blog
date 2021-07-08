class UsersController < ApplicationController
  def new
    redirect_to articles_path if logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "welcome to Pawns blog #{@user.userName}"
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def edit
    redirect_to articles_path if current_user != User.find(params[:id])
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "your a ccount was updated successfully #{@user.userName}"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end


  private
  def user_params
    params.require(:user).permit(:userName, :email, :password )
  end



end
