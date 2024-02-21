# frozen_string_literal: true

class FloorsController < ApplicationController
  before_action :set_Floors, only: %i[show update destroy]

  # GET /Floors
  def index
    @Floors = Floor.all
    render json: @Floors
  end

  # DELETE /Floors/1
  def destroy
    authorize @Floors, :destroy?
    @Floors.destroy
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_Floors
    @Floors = Floors.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def floors_params
    params.require(:floor).permit(:floor_name)
  end
end
