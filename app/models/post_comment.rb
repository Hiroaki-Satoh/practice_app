class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :book

  # バリデーション
  validates :comment, presence: true, length: {maximum: 100}
end
