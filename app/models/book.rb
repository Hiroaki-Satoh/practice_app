class Book < ApplicationRecord
  attachment :book_image, destroy: false

  belongs_to :user

  # バリデーション
  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 200}
end
