class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def show
    
    @user = User.find(params[:id])
    @books = @user.books
    
  
  end
  
  

  def index
    @users = User.all
    @books = Book.all
  end
  
  def update 
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
