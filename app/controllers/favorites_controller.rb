class FavoritesController < ApplicationController
  before_action :authenticate_user!


  def create
    @book.favorites.create(user_id: current_user.id)
  end

  def destroy
    favorite = current_user.favorites.find_by(book_id: @book.id)
    favorite.destroy
  end

  private



  def favorite_params
    params.require(:favorite).permit(:user_id, :book_id)
  end
end