class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @book = Book.new
    @users =User.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
