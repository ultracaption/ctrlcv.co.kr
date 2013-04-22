class Bookmark < ActiveRecord::Base
  belongs_to :lecture
  belongs_to :user

  validates :user_id, uniqueness: { scope: :lecture_id }
end
