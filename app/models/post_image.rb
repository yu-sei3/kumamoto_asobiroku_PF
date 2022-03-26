class PostImage < ApplicationRecord
  # 会員
  belongs_to :end_user
  # ジャンル
  belongs_to :genre
  # コメント機能
  has_many :post_comments, dependent: :destroy
  # いいね機能
  has_many :favorites, dependent: :destroy
  # 投稿機能
  has_one_attached :image
  #
  has_one :map

  # バリデーション
  validates :genre_id, :title, :location, presence: true
  validates :image, presence: true, blob: {content_type: :image}
  validates :body, presence: true, length: {minimum: 2, maximum: 300}
  # 投稿画像
  def get_image
    image
  end
  # いいねの判定定義
  def favorited_by?(end_user)
    favorites.exists?(end_user_id: end_user.id)
  end

end
