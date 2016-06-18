class ListController < ApplicationController

  def index
  	@events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  	@event = Event.find(params[:id])
  end

  def add_entrant
  	entrant = Entrant.new()
  	entrant.event_id = params[:event_id]
  	entrant.company_id = params[:company_id]
  	#entrant.user_id = 0
  	entrant.save
  end

end
