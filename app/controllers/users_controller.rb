class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books

  end

  def edit
     @user = User.find(params[:id])


  end

  def index
    @books = Book.new
    @users = User.all
    @user = User.new
    @user = current_user
  end
  def updated
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(user.id)
  end

  private
  def user_params
    params.require(:user).permit(:title, :body, :profile_image)
  end

end
