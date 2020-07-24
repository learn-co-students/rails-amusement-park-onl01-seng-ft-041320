class GamesController < ApplicationController

    def index
        @games = Game.all
    end

    def show
        @game = Game.find_by(id: params[:id])
        @score = @game.scores.build(user_id: current_user.id)
    end

    def new
        @game = Game.new
    end

    def create
        @game = Game.create(game_params)
        redirect_to game_path(@game)
    end

    def edit
        @game = Game.find_by(id: params[:id])
        @score = @game.scores.build(user_id: current_user.id)
    end

    def update
        @game = Game.find_by(id: params[:id])
        @game.update(game_params)
        redirect_to game_path(@game)
    end

    private
        def game_params
        params.require(:game).permit(
            :name,
            :min_height,
            :tickets,
            :happiness_rating,
            :nausea_ratiing
        )
        end
end