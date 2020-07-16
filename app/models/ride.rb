class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        if self.enough_tickets && self.tall_enough
            ride
        elsif self.enough_tickets && !self.tall_enough
            "Sorry. " + not_tall_enough
        elsif !self.enough_tickets && self.tall_enough
            not_enough_tickets
        elsif !self.enough_tickets && !self.tall_enough
            not_enough_tickets + " " + not_tall_enough
        end
    end

    def ride
        updated_happiness = self.user.happiness + self.attraction.happiness_rating
        updated_nausea = self.user.nausea + self.attraction.nausea_rating
        updated_tickets = self.user.tickets - self.attraction.tickets
        self.user.update(
        :happiness => updated_happiness,
        :nausea => updated_nausea,
        :tickets => updated_tickets
        )
        "Thanks for riding the #{self.attraction.name}!"
    end

    def enough_tickets
        if self.user.tickets >= self.attraction.tickets
            has_enough_tickets = true
        end
        has_enough_tickets
    end

    def tall_enough
        if self.user.height >= self.attraction.min_height
            is_tall_enough = true
        end
        is_tall_enough
    end

    def not_enough_tickets
        "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    end

    def not_tall_enough
        "You are not tall enough to ride the #{self.attraction.name}."
    end

end
