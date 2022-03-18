class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # 投稿機能
  has_many :post_images, dependent: :destroy

  # コメント機能
  has_many :post_comments, dependent: :destroy

  # いいね機能
  has_many :favorites, dependent: :destroy

  # フォロー/フォロワー関係
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォローされる側を取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォローする側を取得
  # 一覧画面に使用
  has_many :following_end_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_end_user, through: :followed, source: :follower  # 自分をフォローしている人

  # プロフィール画像
  has_one_attached :profile_image

  # バリデーション
  validates :name, length: {minimum: 2, maximum: 20}, uniqueness: true
  # validates :introduction, length: {maximum: 100}

  # プロフィール画像未設定時表示
  def get_profile_image
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

  def self.guest
    find_or_create_by!(name: 'guestuser', email: 'kumamoto@likers.com') do |end_user|
      end_user.password = SecureRandom.urlsafe_base64
      end_user.name = "guestuser"
    end
  end

end
