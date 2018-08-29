class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  	  @user = User.find(params[:id])
  	  @book = Book.new
      @books = @user.books.all
  end

  def create
  	  @book = Book.new(book_params)
  	  @book.user_id = current_user.id
  	  if @book.save
  	  redirect_to book_path(@book), notice: 'successfully!'
      else
      @books = Book.all
      render :'books/index'
      end

  end

  def index
      @users = User.all
      @user = User.find(current_user.id)
      @book = Book.new
  end

  def new
  end

  def edit
      @user = User.find(params[:id])
      if @user.id != current_user.id
        redirect_to user_path(current_user.id)
      end
  end

  def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to user_path(@user.id), notice: 'successfully!'
      else
        render :edit
      end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :profile_body)
  end
  def book_params
        params.require(:book).permit(:title, :body, :user_id)
  end
end
