class BooksController < ApplicationController
  before_action :authenticate_user!


  def create
    @books=Book.all
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
      redirect_to book_path(@book.id),notice:'You have created book successfully.'
    else
      render :index
    end
  end

  def index
    @books=Book.all
    @book=Book.new
  end

  def show
    @book_show=Book.find(params[:id])
    @book=Book.new
    @user=@book_show.user
    @book_comment=BookComment.new

  end

  def edit
    @book=Book.find(params[:id])
    unless @book.user_id == current_user.id
      redirect_to books_path
    end
  end

  def update
    @book=Book.find(params[:id])
  if @book.update(book_params)
    redirect_to book_path(@book),notice:'You have updated book successfully.'
  else
    render :edit
  end
  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def search
    @books=Book.search(params[:search])
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end
end
