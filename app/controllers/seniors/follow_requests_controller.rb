class Seniors::FollowRequestsController < ApplicationController
  def index
    
    @follow_requests = current_senior.follow_requests.all
  end

  def allow
    request = FollowRequest.find(params[:id])
    junior = Junior.find_by(id:request.junior_id)
    follow = current_senior.junior_follows.new(senior_id:current_senior.id, junior_id: junior.id)
    follow.save
    request.destroy
    redirect_back(fallback_location: seniors_seniors_junior_junior_follows_path)
  end

  def destroy
    request = FollowRequest.find(params[:id])
    request.destroy
    redirect_back(fallback_location: seniors_seniors_junior_junior_follows_path)
  end
end