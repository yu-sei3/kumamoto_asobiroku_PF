class Contact < ApplicationRecord

  # バリデーション
  validates :name, :content, presence: true

end
