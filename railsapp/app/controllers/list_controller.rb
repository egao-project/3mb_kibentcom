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
  	entrant.user_id = current_user.id
  	entrant.save
  end

  def new
    @event = Event.new
    @event.company_id = 1 #ログインユーザーの会社IDにする
  end

  def create
    data = upload_params
    @event = Event.new(event_params)
    db_filename = 'images/' + Time.now.strftime('%Y%m%d%H%M%S') + data[:datafile].original_filename
    filename = './public/' + db_filename

    @event.img_path = db_filename
    if @event.save

      File.open(filename, 'wb') do |of|
        of.write(data[:datafile].read)
      end
      redirect_to :action=>"index"
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end    
  end

  def event_params
    params.fetch(:event, {}).permit(:company_id, :title, :desc_title, :desc , :start , :end ,:max)
  end
  def upload_params
    params.fetch(:upload, {}).permit(:datafile)
  end

end
