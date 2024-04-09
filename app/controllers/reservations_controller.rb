# frozen_string_literal: true

class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]

  # GET /Reservations
  def index
    @reservations = Reservation.all

    render json: @reservations
  end

  # GET /Reservations/1
  def show
    render json: @reservation
  end

  def get_reservation_by_space
    @reservations = Reservation.where(space_id: params[:space_id])

    render json: @reservations
  end

  def get_reservation_by_user
    @reservations = @current_user.reservations.includes(space: :floor)
    
    render json: @reservations, include: {space: {include: :floor}}
  end

  # POST /Reservations
  def create
    reservation = reservation_params
    reservation[:user_id] = @current_user.id

    if @reservation = Reservation.create!(reservation)
      render json: @reservation, status: :created, location: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /Reservations/1
  def update
    authorize @reservation, :update?
    if @reservation.update(reservation_params)
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /Reservations/1
  def destroy
    authorize @reservation, :destroy?
    @reservation.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:space_id, :user_id, :start_time, :end_time, :text, :admin_block)
  end
end
