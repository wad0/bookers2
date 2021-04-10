class BookCommentsController < ApplicationController

  def create
    @book_show = Book.find(params[:book_id])
    @book_comment = BookComment.new(book_comment_params)
    @book_comment.user_id = current_user.id
    @book_comment.book_id = @book_show.id
    if @book_comment.save
      render :index
    end
  end

  def destroy
		@book_show = Book.find(params[:book_id])
  	book_comment = @book_show.book_comments.find(params[:id])
  	if book_comment.destroy
  	  render :index
  	end
	end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
