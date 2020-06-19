class RidesController < ApplicationController
    helper_method :tall_enough?, :enough_tickets

    def create
        ride = Ride.create(ride_params)
        flash[:message] = ride.take_ride
        redirect_to user_path(ride.user)
    end
    
    private

    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end
end