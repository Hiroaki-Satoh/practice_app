class FavoritesController < ApplicationController
  # いいねする
  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save
    # 直前のページへリダイレクトする。 fallback => root_pathへ
    redirect_back(fallback_location: root_path)
  end

  # いいねを取り消す
  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    # 直前のページへリダイレクトする。 fallback => root_pathへ
    redirect_back(fallback_location: root_path)
  end
end
