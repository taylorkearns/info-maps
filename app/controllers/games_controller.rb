class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find params[:id]

    render "#{@game.template_name}"
  end
end
