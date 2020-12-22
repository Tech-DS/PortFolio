class Seniors::EventsController < ApplicationController
  def index
    @events = current_senior.events
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    @event.senior_id = current_senior.id
    if @event.save
       flash[:notice] = "投稿しました。"
       @events = Event.all
       redirect_to events_path
    else
       @events = Event.all
         flash[:notice] = ' エラーです。'
        render "index"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path, notice:"削除しました"
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
   if @event.update(event_params)
     redirect_to events_path, notice: "編集しました"
   else
     render 'edit'
   end
  end


  private
  def event_params
    params.require(:event).permit(:title, :content, :start_time)
  end
end
