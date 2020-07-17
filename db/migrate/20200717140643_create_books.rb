class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.integer  :user_id,       null: false # 投稿したユーザのID
      t.string   :book_image_id              # 本の画像
      t.string   :title,         null: false # 投稿タイトル（本のタイトル）
      t.text     :body,          null: false # 本文（感想）
      t.timestamps
    end
  end
end
