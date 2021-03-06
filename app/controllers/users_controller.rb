class UsersController < ApplicationController

  # 一覧表示
  def index
  	@users = User.all      # 一覧表示するためにUserモデルのデータを全て変数に入れて取り出す。
  	@book = Book.new       # new bookの新規投稿で必要（保存処理はbookコントローラー側で実施）
    @user = current_user
  end

  # 詳細ページ(マイページ）の表示
  def show
  	@user = User.find(params[:id])
  	@books = @user.books
  	@book = Book.new      # new bookの新規投稿で必要（保存処理はbookコントローラー側で実施）
  end

  # 編集ページの表示
  def edit
  	@user = User.find(params[:id])
    if current_user != @user
      redirect_to user_path(current_user)
    end
  end

  # データ変更の保存
  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		redirect_to user_path(@user), notice: "successfully updated user!"
  	else
  		render "edit"
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
