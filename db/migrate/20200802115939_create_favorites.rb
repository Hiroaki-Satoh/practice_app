class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :user_id # いいねしたユーザのID
      t.integer :book_id # いいねされた投稿のID
      t.timestamps
    end
  end
end
