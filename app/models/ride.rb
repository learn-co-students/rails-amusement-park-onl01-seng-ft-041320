class Ride < ApplicationRecord
    belongs_to :attraction
    belongs_to :user


    def take_ride
        @message=""
        if !verify
            attraction.increment(:counter).save
            user.decrement(:tickets, attraction.tickets)
            user.increment(:nausea, attraction.nausea_rating)
            user.increment(:happiness, attraction.happiness_rating).save
            return "Thanks for riding the #{attraction.name}!"
        else
            return @message
        end
    end

    def verify
        if not_tall_enough && not_enough_tickets
            @message = "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif not_tall_enough
            @message = "Sorry. You are not tall enough to ride the #{attraction.name}."
        elsif not_enough_tickets
            @message = "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        end
    end

    def not_enough_tickets
        user.tickets < attraction.tickets
    end

    def not_tall_enough
        user.height < attraction.min_height
    end
end
