class RoomsController < ApplicationController
  def index
    @rooms = Room.all.order("campus ASC").order("floor ASC")
  end

  def new
    @room = Romm.new
  end

  def show
    @room = Room.find(params[:id])
    @seats = @room.seats.order("seat_id ASC")
  end

  def create
    @room = Room.new(room_params)
    @room.save
    redirect_to rooms_path
  end

private
  def room_params
    params.require(:room).permit(:id, :name, :campus, :floor)
  end
end
