class User < ActiveRecord::Base
    has_secure_password

    has_many :rides 
    has_many :attractions, through: :rides
    
    validates :name, presence: true 
    validates :password, presence: true

    def mood
        unless admin
            happiness > nausea ? "happy" : "sad"
        end
    end
    
    def self.create_by_github_omniauth(auth)
      self.find_or_create_by(username: auth[:info][:email]) do |u|
        u.email = auth[:info][:email]  
        u.password = SecureRandom.hex
  
      end
    end

end