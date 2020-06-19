class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  validates :admin, inclusion: { in: [true, false] }

  def mood
    if !self.nausea || !self.happiness
      ""
    elsif self.nausea > self.happiness
      "sad"
    else
      "happy"
    end
  end
end
