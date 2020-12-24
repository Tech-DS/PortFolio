class Juniors::FollowRequestsController < ApplicationController
  def create
    senior = Senior.find(params[:senior_id])
    request = current_junior.follow_requests.new(senior_id: senior.id, junior_id: current_junior.id)
    request.save
    redirect_back(fallback_location: about_path)
  end

  def destroy
    senior = Senior.find(params[:senior_id])
    request = current_junior.follow_requests.find_by(senior_id: senior.id, junior_id: current_junior.id)
    request.destroy
    redirect_back(fallback_location: about_path)
  end
end
