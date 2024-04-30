# frozen_string_literal: true

class SpacesController < ApplicationController
  before_action :set_spaces, only: %i[update destroy]

  # GET /Spaces
  def get_space_geo_by_floor
    @spaces = Space.where(floor_id: params[:floor_id]).includes(:space_geometry)
    render json: @spaces.as_json(include: :space_geometry)
  end

  def index
    @spaces = Space.includes(:space_geometry)
    render json: @spaces.as_json(include: :space_geometry)
  end

  # GET /Spaces/1
  def show
    @Spaces_floors = Space.select(:floor_id).distinct.order(:floor_id)
    render json: @Spaces_floors, include: :space_geometry
  end

  # POST /Spaces
  def create
    @Spaces = Space.new(spaces_params)
    authorize @Spaces, :create?

    if @Spaces.save
      render json: @Spaces, status: :created, location: @Spaces
    else
      render json: @Spaces.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /Spaces/1
  def update
    authorize @Spaces, :update?
    if @Spaces.update(spaces_params)
      render json: @Spaces
    else
      render json: @Spaces.errors, status: :unprocessable_entity
    end
  end

  # DELETE /Spaces/1
  def destroy
    authorize @Spaces, :destroy?
    @Spaces.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_spaces
    @Spaces = Space.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def spaces_params
    params.permit(:spaces_name, :floor_id, :max_occupancy, :description)
  end
end
