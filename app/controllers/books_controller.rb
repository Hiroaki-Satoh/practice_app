class BooksController < ApplicationController
  before_action :authenticate_user! # ログインしているユーザにのみ許可する。
  before_action :set_user
  before_action :new_book, only: [:index, :show, :edit]

  def index
  	@books = Book.all # 一覧表示するためにBookモデルの情報を全取得する
  end

  def show
  	@show_book = Book.find(params[:id])
    @user = @show_book.user
    @comments = @show_book.post_comments
    @comment = PostComment.new
  end

  def create
  	@book = Book.new(book_params) # Bookモデルのテーブルを使用しているのでbookコントローラで保存する。
    @book.user_id = current_user.id
  	if @book.save # ここでデータベースに保存される
  		redirect_to @book, notice: "successfully created book!"
  	else
  		@books = Book.all
      @user = current_user
  		render 'index'
  	end
  end

  def edit
  	@edit_book = Book.find(params[:id])
    if current_user != @edit_book.user
      redirect_to books_path
    end
  end

  def update
  	@book = Book.find(params[:id])
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

  def new_book
    @book = Book.new
  end

  def book_params
  	params.require(:book).permit(:title, :body, :book_image)
  end

end
