class BookCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    comment = BookComment.new(book_comment_params)
    comment.user_id = current_user.id
    comment.book_id = book.id
    if comment.save
      redirect_to book_path(book)
    else
      @book_show=Book.find(params[:id])
      @book_comment=BookComment.new
      render 'books/show'
    end
  end

  def destroy

  end

end
