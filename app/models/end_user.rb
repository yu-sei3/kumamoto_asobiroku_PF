class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_images, dependent: :destroy

  has_many :post_comments, dependent: :destroy

  has_many :favorites, dependent: :destroy

  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォローされる側を取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォローしてくる側を取得
  has_many :following_end_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_end_user, through: :followed, source: :follower  # 自分をフォローしている人

  has_one_attached :profile_image

  # プロフィール画像未設定時表示
  def get_profile_image(width, height)
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

  # ユーザーをフォローする
  def follow(end_user_id)
    follower.create(followed_id: end_user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(end_user_id)
    follower.find_by(followed_id: end_user_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(end_user)
    following_end_user.include?(end_user)
  end

end
