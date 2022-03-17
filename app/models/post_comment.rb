class PostComment < ApplicationRecord
  # 会員
  belongs_to :end_user
  # 投稿機能
  belongs_to :post_image

  # バリデーション
  validates :comment, presence: true, length: {minimum: 2, maximum: 100}

end
