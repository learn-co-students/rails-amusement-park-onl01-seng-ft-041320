class Ride < ApplicationRecord
  belongs_to :attraction
  belongs_to :user
  validates :user_id, :attraction_id, presence: true
end
