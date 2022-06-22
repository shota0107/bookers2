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
    @book = Book.find(params[:id])

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     redirect_to book_path(@book.id), notice: 'successfully.'

    else
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    redirect_to book_path(@book.id)
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path

  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
