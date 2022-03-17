class Genre < ApplicationRecord
    # 投稿機能
    has_many :post_images, dependent: :destroy

    validates :name, presence: true, uniqueness: true

end
