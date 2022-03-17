class Favorite < ApplicationRecord
    # 会員
    belongs_to :end_user
    # 投稿機能
    belongs_to :post_image

end
