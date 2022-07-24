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
    redirect_to book_path(@book.id), notice: 'You have created book successfully.'
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = current_user
  end

  def update
    @book = current_user
    @user = @book.user
    @book.update(book_params)
    redirect_to book_path(@user.id), notice: 'You have updated book successfully.'
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
