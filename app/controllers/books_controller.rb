class BooksController < ApplicationController
    before_action :authenticate_user!

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
          @users = User.find(current_user.id)
          render :index
        end
    end

    def index
        @books = Book.all
        @book = Book.new
        @users = User.find(current_user.id)
    end

    def show
    	@book = Book.find(params[:id])
        @books = Book.new
        @users = User.find(current_user.id)
    end

    def edit
        @book = Book.find(params[:id])
        if @book.user.id != current_user.id
            redirect_to books_path
        end
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
        params.require(:book).permit(:title, :body)
    end
    def user_params
        params.require(:user).permit(:name, :profile_image, :profile_body)
    end

end
