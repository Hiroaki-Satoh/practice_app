class Book < ApplicationRecord
  attachment :book_image, destroy: false

  belongs_to :user
  # いいね機能を追加
  has_many :favorites, dependent: :destroy
  # コメント機能を追加
  has_many :post_comments, dependent: :destroy

  # バリデーション
  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 200}

  # 投稿に付けられた「いいね」にログインしているユーザのものが含まれるか否かを判定するメソッド
  def favorited_by?(user)
  	favorites.where(user_id: user.id).exists?
  end
end
