class Juniors::PostsController < ApplicationController

  def index
    @seniors = current_junior.junior_follows.all
    @posts = @seniors.Post.find(params[:id])
  end

  private

  


end