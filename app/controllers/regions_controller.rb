class RegionsController < ApplicationController
  def demo
  end

  def index
    @regions = Region.all
  end

  def show
    @region = Region.find params[:id]

    if params[:game_id]
      render 'find_the_country'
    end
  end

  def find_the_country
  end
end
