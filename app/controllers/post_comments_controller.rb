class PostCommentsController < ApplicationController

  # コメントの作成
  def create
  	@show_book = Book.find(params[:book_id])
  	@comment = PostComment.new(post_comment_params)
  	@comment.user_id = current_user.id
  	@comment.book_id = @show_book.id
  	if @comment.save
  	  redirect_to book_path(@show_book), notice: "Successfully created."
  	end
  end

  # コメントの削除
  def destroy
  	@comment = PostComment.find(params[:book_id])
  	if @comment.destroy
  	  redirect_to book_path(@show_book), notice: "Successfully deleted."
  	end
  end

  private
  def post_comment_params
  	params.require(:post_comment).permit(:comment)
  end
end
