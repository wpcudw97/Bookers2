class UsersController < ApplicationController

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @books = Book.where(user_id:params[:id])
    @user = User.find(params[:id])
    @user.user_id = current_user.id
    @book = Book.new
    @user.save
  end

  def edit
    @user = User.find(params[:id])
    @user = current_user
    user_id = params[:id].to_i
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to user_path(@user.id)
    end

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
