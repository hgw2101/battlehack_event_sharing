class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: "User"

  validates :user_id, presence: true, uniqueness: {scope: :friend_id}
end
