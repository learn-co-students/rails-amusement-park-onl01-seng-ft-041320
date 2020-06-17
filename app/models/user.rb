class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    validates :password, presence: :true, on: :create 
    validates :name, presence: :true, uniqueness: :true
    # validates :height, presence: :true, numericality: :true
    # validates :nausea, presence: :true, numericality: :true
    # validates :happiness, presence: :true, numericality: :true
    # validates :tickets, presence: :true, numericality: :true
    
    has_secure_password

    def mood
        if nausea > happiness
            "sad"
        else
            "happy"
        end
    end
end
