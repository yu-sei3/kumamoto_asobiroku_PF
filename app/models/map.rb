class Map < ApplicationRecord

  belongs_to :post_image

  geocoded_by :address
  after_validation :geocode

end
