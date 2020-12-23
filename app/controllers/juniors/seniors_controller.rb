class Juniors::SeniorsController < ApplicationController
  def index
    @seniors = current_junior.follow_seniors
  end

  def show
    @senior = Senior.find(params[:id])
  end

  def timeline
    @senior = Senior.find(params[:id])
    if junior_signed_in?
      seniors_array = current_junior.follow_seniors.pluck(:senior_id)
      senior_id = @senior.id

      unless seniors_array.include?(senior_id) == true
        flash[:notice] = "フォローしている方のみアクセスできます。"
        redirect_to request.referer || root_url
      end
    else
       flash[:notice] = "ログインしてくだい。"
       redirect_to root_path
    end
  end

  def search
    @seniors = Senior.search(params[:search])
  end
end
