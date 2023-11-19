# frozen_string_literal: true

class ReservationsController < ApplicationController
  before_action :set_Reservation, only: %i[show update destroy]

  def index
    @Reservations = Reservation.all

    render json: @Reservations
  end

  def show
    render json: @Reservation
  end

  def create
    @Reservation = Reservation.new(Reservation_params)

    if @Reservation.save
      render json: @Reservation, status: :created, location: @Reservation
    else
      render json: @Reservation.errors, status: :unprocessable_entity
    end
  end

  def update
    if @Reservation.update(Reservation_params)
      render json: @Reservation
    else
      render json: @Reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @Reservation.destroy
  end

  private

  def set_Reservation
    @Reservation = Reservation.find(params[:id])
  end

  def Reservation_params
    params.require(:Reservation).permit(:name, :relationship)
  end
end
