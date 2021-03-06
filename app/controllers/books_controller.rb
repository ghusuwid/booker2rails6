class BooksController < ApplicationController
  before_action :correct_user, only: [:edit ]


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all

  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
     redirect_to books_path
     flash[:notice] = "Book was successfully destroyed."
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
      flash[:notice] = "Book was successfully updated."
    else
      render :edit
    end

  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  def correct_user
    @book = Book.find(params[:id])
    redirect_to books_path unless @book.user == current_user
  end
end
