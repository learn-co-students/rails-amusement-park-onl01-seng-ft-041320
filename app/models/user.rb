class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides
    def mood
        if self.nausea.to_i < self.happiness.to_i
            'happy'
        else
            'sad'
        end
    end

    def is_admin?
        return "ADMIN" if self.admin
    end
end
