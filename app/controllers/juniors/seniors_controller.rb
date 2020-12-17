class Juniors::SeniorsController < ApplicationController
    
  def index
    @seniors = Senior.search(params[:search])
  end
end
