class RegionsController < ApplicationController
  def demo
  end

  def index
    @regions = Region.all
  end

  def show
    @region = Region.find params[:id]
  end
end
