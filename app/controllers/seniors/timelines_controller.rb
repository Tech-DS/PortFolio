class Seniors::TimelinesController < ApplicationController
  def new
    @timeline = Timeline.new
  end

  def create
     @senior = current_senior
     @timeline = Timeline.new(timeline_params)
     @timeline.senior_id = (current_senior.id)
    if @timeline.save
     @timelines = Timeline.all
      redirect_to timelines_path(@timeline), notice: "思い出を書き記しました"
    else
      render :new
    end
  end

  def index
    @senior = Senior.find(current_senior.id)
    @timelines = current_senior.timelines.order(year: :asc)
    @timeline = Timeline.new
  end

  def show
    @timeline = Timeline.find(params[:id])
  end

  def destroy
    @timeline = Timeline.find(params[:id])
    @timeline.destroy
    redirect_to timelines_path
  end

  private
  def timeline_params
    params.require(:timeline).permit(:year, :age, :event, :detail, :feel, :image)
  end
end