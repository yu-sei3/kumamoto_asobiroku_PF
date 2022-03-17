class Relationship < ApplicationRecord
  # フォローされる側
  belongs_to :follower, class_name: "EndUser"
  # フォローする側
  belongs_to :followed, class_name: "EndUser"

end
