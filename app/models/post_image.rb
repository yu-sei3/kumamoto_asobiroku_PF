class PostImage < ApplicationRecord

  belongs_to :end_user
  belongs_to :genre

  has_many :post_comments, dependent: :destroy

  has_many :favorites, dependent: :destroy

  has_one_attached :image

  def get_image
    image
  end

  def favorited_by?(end_user)
    favorites.exists?(end_user_id: end_user.id)
  end

end
