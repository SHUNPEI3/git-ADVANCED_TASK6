class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    book_comment = BookComment.new(book_comment_params)
    book_comment.book_id = @book.id
    book_comment.user_id = current_user.id
    book_comment.save
    render "book_comment-index.js.erb"
  end
  def destroy
    @book = Book.find(params[:book_id])
    book_comment = BookComment.find(params[:id])
    book_comment.destroy
    render "book_comment-index.js.erb"
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
