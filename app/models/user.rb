class User < ApplicationRecord
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    validates :name, presence: true
    validates :password, presence: true, on: [:create]

    def mood
        if self.nausea && self.happiness
            if self.nausea > self.happiness
                "sad"
            else
                "happy"
            end
        else
            "happy"
        end
    end
    

    
    
end
