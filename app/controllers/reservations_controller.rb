# frozen_string_literal: true

class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]

  # GET /Reservations
  def index
    @Reservations = Reservation.all

    render json: @Reservations
  end

  # GET /Reservations/1
  def show
    render json: @Reservation
  end

  def get_reservation_by_space
    @Reservations = Reservation.where(space_id: params[:space_id])

    render json: @Reservations
  end

  def get_reservation_by_user
    @Reservations = @current_user.reservations.includes(:space)
    
    render json: @Reservations, include: :space
  end

  # POST /Reservations
  def create
    reservation = reservation_params
    reservation[:user_id] = @current_user.id

    if @Reservation = Reservation.create!(reservation)
      render json: @Reservation, status: :created, location: @Reservation
    else
      render json: @Reservation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /Reservations/1
  def update
    if @Reservation.update(reservation_params)
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
  def set_reservation
    @Reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:space_id, :user_id, :start_time, :end_time, :text, :admin_block)
  end
end
