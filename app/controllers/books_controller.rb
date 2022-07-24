class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def show
    @user = User.find(params[:id])
    @book = Book.find(params[:id])
  end

  def edit
    @book = current_user
  end

  def update
    @book = current_user
    @book.update(book_params)
    redirect_to users_path(current_user.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path(params[:id])
  end


  private
  #ストロングパラメーター
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
