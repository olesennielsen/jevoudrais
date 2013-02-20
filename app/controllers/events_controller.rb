class EventsController < ApplicationController
  def new
    @event = Event.new
    
    respond_to do |format|
      format.html # new.html.erb
    end
  end
  
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to root_path, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @event = Event.find(params[:id])    
    @event.destroy  

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
      format.js
    end
  end
end