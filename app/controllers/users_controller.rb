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
    if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
      redirect_to user_path
    else
      render :edit
    end  
  end
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
