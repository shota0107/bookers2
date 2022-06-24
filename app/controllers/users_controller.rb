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
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
    @users = current_user.users
    @user = @users.find_by(id: params[:id])
    redirect_to new_post_path unless @user
  end

end
