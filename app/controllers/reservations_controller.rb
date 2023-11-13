class ReservationsController < ApplicationController
    before_action :set_Reservation, only: %i[ show update destroy ]
  
    # GET /Reservations
    def index
      @Reservations = Reservation.all
  
      render json: @Reservations
    end
  
    # GET /Reservations/1
    def show
      render json: @Reservation
    end
  
    # POST /Reservations
    def create
      @Reservation = Reservation.new(Reservation_params)
  
      if @Reservation.save
        render json: @Reservation, status: :created, location: @Reservation
      else
        render json: @Reservation.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /Reservations/1
    def update
      if @Reservation.update(Reservation_params)
        render json: @Reservation
      else
        render json: @Reservation.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /Reservations/1
    def destroy
      @Reservation.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_Reservation
        @Reservation = Reservation.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def Reservation_params
        params.require(:Reservation).permit(:name, :relationship)
      end
  end