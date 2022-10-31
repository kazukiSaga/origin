class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @users = User.all
    @login_users = User.where.not(id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @films_registered_as_favorites = Film.includes(:favorites).where(user_id: current_user.id)
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to users_path, alert: '不正なアクセスです。'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "更新に成功しました。"
    else
      render :edit
    end
  end
  
  def followings
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  private 
  def user_params
    params.require(:user).permit(:name, :email, :nickname)
  end
end