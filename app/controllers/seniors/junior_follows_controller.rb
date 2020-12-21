class Seniors::JuniorFollowsController < ApplicationController
  def index
    @followers = current_senior.junior_follows.all
    @seniors = FollowRequest.where(senior_id: current_senior.id)
  end

  def destroy
    follow = JuniorFollow.find(params[:id])
    follow.destroy
    redirect_back(fallback_location: seniors_seniors_junior_junior_follows_path)
  end
end
