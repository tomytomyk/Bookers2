class BooksController < ApplicationController

	def new
		@book = Book.new
	end

	def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
          redirect_to book_path(@book.id), notice: 'successfully!'
        else
          @books = Book.all
          @user = User.find(current_user.id)
          render :index
        end
    end

    def index
        @books = Book.all
        @book = Book.new
        @user = User.find_by(params[:id])
        @users = User.find(current_user.id)
    end

    def show
    	@book = Book.find(params[:id])
        @books = Book.new
        @user = User.find(@book.user.id)
        @users = User.find(current_user.id)
    end

    def edit
        @book = Book.find(params[:id])
        @user = User.find(current_user.id)
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
          redirect_to book_path(@book.id), notice: 'successfully!'
        else
          @user = User.find(current_user.id)
          render :edit
        end
    end

    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to books_path
    end

    private
    def book_params
        params.require(:book).permit(:title, :body, :user_id)
    end
    def user_params
        params.require(:user).permit(:name, :profile_image, :profile_body)
    end

end
