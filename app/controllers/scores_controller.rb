class ScoresController < ApplicationController

    def create
        @score = Score.create(score_params)
        flash[:notice] = @score.take_score
        redirect_to user_path(current_user.id)
    end

    private

    def score_params
        params.require(:score).permit(:user_id, :attraction_id)
    end

end