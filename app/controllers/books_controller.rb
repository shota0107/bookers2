class BooksController < ApplicationController
  def new
    @Books = Book.new
  end

  def index
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @user = User.find(params[:id])

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book = destroy
    redirect_to book_path(@book.id)

  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
