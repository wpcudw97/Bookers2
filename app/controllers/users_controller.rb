class UsersController < ApplicationController

  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @user.user_name = current_user.name
    @user.save
    redirect_to users_path
  end

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  # def edit
  # end

  private

  def user_params
    params.require(:user).permit(:title,:body)
  end
end
