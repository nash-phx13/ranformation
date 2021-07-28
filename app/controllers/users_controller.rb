class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @runs = @user.runs
    @run = Run.new
    @runs = @runs.page(params[:page]).per(3)
   
  end

  def index
    @users = User.all
    @run = Run.new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  #顧客退会画面
  def unsubscribe
    @user = User.find_by( params[:id])
  end

  #顧客退会処理
  def withdraw
    @user = User.find_by( params[:id])
    @user.update(is_active: false)
    reset_session
    redirect_to root_path
    flash[:notice]='またのご利用お待ちしております。'
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image,:is_active)
  end

  def check_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
