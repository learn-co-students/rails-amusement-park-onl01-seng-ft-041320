class RidesController < ApplicationController
    before_action :require_login

    def create
        @ride = Ride.new(attraction_id: params[:attraction_id], user_id: current_user.id)
        if @ride.save
            flash[:alert] = @ride.take_ride
            redirect_to user_path(current_user)
        else
          redirect_to attractions_path
        end
    end

end