class Book < ApplicationRecord
  attachment :book_image, destroy: false

  belongs_to :user
  # いいね機能
  has_many :favorites, dependent: :destroy

  # バリデーション
  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 200}

  def favorited_by?(user)
  	favorites.where(user_id: user.id).exists?
  end
end
