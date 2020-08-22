class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
	  t.integer :user_id, null: false # コメントしたユーザのID
	  t.integer :book_id, null: false # コメントされた投稿のID
	  t.text    :body,    null: false # コメント本文
      t.timestamps
    end
  end
end
