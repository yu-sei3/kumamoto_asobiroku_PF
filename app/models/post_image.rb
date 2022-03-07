class PostImage < ApplicationRecord

  belongs_to :end_user
  belongs_to :genre

  has_many :favorites, dependent: :destroy

  def favorited_by?(end_user)
    favorites.exists?(end_user_id: end_user.id)
  end

end
