class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        say = "Sorry."
        if user.height >= attraction.min_height && user.tickets >= attraction.tickets
            user.update(tickets: user.tickets - attraction.tickets)
            user.update(nausea: user.nausea + attraction.nausea_rating)
            user.update(happiness: user.happiness + attraction.happiness_rating)

            say = "Thanks for riding the #{attraction.name}!"
        else

            say << " You do not have enough tickets to ride the #{attraction.name}." unless user.tickets >= attraction.tickets
            say << " You are not tall enough to ride the #{attraction.name}." unless user.height >= attraction.min_height

            say 
        end
    end
end
