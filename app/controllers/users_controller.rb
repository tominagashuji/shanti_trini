class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :login_check, only: [:show, :edit]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @favorite_events = @user.favorites_events
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'ユーザー情報の登録が完了しました！'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'ユーザー情報を更新しました！'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    format.html { redirect_to users_url, notice: 'ユーザー情報を削除しました！' }
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
  end

  def login_check
    @user = User.find(params[:id])
    if current_user.nil?
      redirect_to tops_path, notice:"ログインしてください。"
    elsif current_user.id != @user.id
      redirect_to tops_path, notice:"別アカウントのアクセスはできません。"
    end
  end
end
