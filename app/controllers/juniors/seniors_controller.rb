class Juniors::SeniorsController < ApplicationController
  def index
    @seniors = current_junior.follow_seniors
  end

  def show
    @senior = Senior.find(params[:id])
  end

  def search
    @seniors = Senior.search(params[:search])
  end
end
