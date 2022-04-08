class UsersController < ApplicationController
before_action :move_to_signed_in, only: [:index, :show, :edit]
before_action :correct_user, only: [:edit, :update]

  
  def edit
    @user = User.find(params[:id])
  end

  def show
    
    @user = User.find(params[:id])
    @books = @user.books
    @book =  Book.new
    
  
  end
  
  
  def create
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end
  

  def index
    @users = User.all
    @books = Book.all
    @book = Book.new
    
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
  
  
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def book_params
    params.require(:book).permit(:title,:body)
  end
  
  def correct_user
    @user = User.find(params[:id])
    
    redirect_to(user_path(current_user)) unless @user == current_user
  end
  
  def move_to_signed_in
    unless user_signed_in?
      
      redirect_to  '/users/sign_in'
    end
  end
  
end
