class UsersController < ApplicationController

  def new
    @user = User.new
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
