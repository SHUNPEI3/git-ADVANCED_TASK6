class FavoritesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.book_id = @book.id
    favorite.save
    render "favorite.js.erb"
    # redirect_to request.referer
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = Favorite.find_by(book_id: @book.id, user_id: current_user.id)
    favorite.destroy
    render "favorite.js.erb"
    # redirect_to request.referer
  end
end
