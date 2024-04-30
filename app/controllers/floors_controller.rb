# frozen_string_literal: true

class FloorsController < ApplicationController
  before_action :set_floor, only: %i[show update destroy]

  # GET /Floors
  def show
    @floor = Floor.includes(:spaces)
    render json: @floor.as_json(include: :spaces)
  end

  # GET /Floors/1
  def index
    @floor = Floor.includes(:spaces)
    render json: @floor.as_json(include: :spaces)
  end

  # GET /buildings/:building_id/floors
  def building_floors
    @building = Building.find(params[:building_id])
    @floors = @building.floors
    render json: @floors.as_json(include: :spaces)
  end

  # DELETE /Floors/1
  def destroy
    authorize @floor, :destroy?
    @floor.destroy
  end

  # POST /floors
  def create
    @floor = Floor.new(floors_params)
    authorize @floor, :create?

    if @floor.save
      Role.create!(type: 'floor', associated_id: @floor.id)
      render json: @floor, status: :created, location: @floor
    else
      render json: @floor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /Floors
  def update
    authorize @floor, :update?
    if @floor.update(floors_params)
      render json: @floor
    else
      render json: @floor.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_floor
    @floor = Floor.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def floors_params
    params.permit(:floor_name, :building_id)
  end
end
