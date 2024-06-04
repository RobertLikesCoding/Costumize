class BookingsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    # trying to grab the bookings first, so I can access the related costumes
    @bookings = current_user.bookings
  end

  def new
    @booking = Booking.new
    @costume = Costume.find(params[:costume_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @costume = Costume.find(params[:costume_id])
    @booking.costume = @costume
    if @booking.save
      redirect_to restaurant_path(@costume)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:user, :costume, :start_date, :end_date)
  end
end
