class UsersController < ApplicationController

  def index
    @user = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @books = Book.all
    @user = User.find(params[:id])
    @user.user_id = current_user.id
    @user = current_user
    @book = Book.new
    @user.save
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'You have updated user successfully.'
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end
end
