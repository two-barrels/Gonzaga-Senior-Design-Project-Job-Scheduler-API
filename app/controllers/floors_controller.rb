# frozen_string_literal: true

class FloorsController < ApplicationController
  before_action :set_Floors, only: %i[show update destroy]

  # GET /Spaces
  def index
    @Floors = Floor.all

    render json: @Floors
  end

  # DELETE /Spaces/1
  def destroy
    @Floors.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_Floors
    @Floors = Floors.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def Floors_params
    params.require(:Floors).permit(:name, :relationship)
  end
end
