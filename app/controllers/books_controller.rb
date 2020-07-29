class BooksController < ApplicationController
  # ログインユーザにのみ許可
  before_action :authenticate_user!
  before_action :set_user

  def index
  	@books = Book.all     # 一覧表示するためにBookモデルの情報を全てくださいのall
    @book = Book.new
  end

  def show
  	@show_book = Book.find(params[:id])
    @user = @show_book.user
    @book = Book.new
  end

  def create
  	@book = Book.new(book_params) # Bookモデルのテーブルを使用しているのでbookコントローラで保存する。
    @book.user_id = current_user.id
  	if @book.save # 入力されたデータをdbに保存する。（ここでセーブされる）
  		redirect_to @book, notice: "successfully created book!"#保存された場合の移動先を指定。
  	else
  		@books = Book.all
      @user = current_user
  		render 'index'
  	end
  end

  def edit
  	@book = Book.find(params[:id])
    @edit_book = Book.new
    if current_user != @book.user
      redirect_to books_path
    end
  end

  def update
  	@book = Book.find(params[:id])
    # if文でエラー発生時と正常時のリンク先を枝分かれにしている。
  	if @book.update(book_params)
  		redirect_to book_path(@book), notice: "successfully updated book!"
  	else
      @edit_book = @book
  		render "edit"
  	end
  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
  	redirect_to books_path, notice: "successfully delete book!"
  end

  private
  def set_user
  	@user = current_user
  end

  def book_params
  	params.require(:book).permit(:title, :body, :book_image)
  end

end
