# frozen_string_literal: true

class BuildingsController < ApplicationController
  before_action :set_building, only: %i[update destroy]
  # GET /Buildings
  def index
    @building = Building.all
    render json: @building
  end

  # GET /Buildings/1
  def show
    @buildings = Building.select(:name)
    render json: @buildings
  end

  def buildings_by_ids
    @buildings = Building.where(id: params[:building_ids])
    render json: @buildings
  end

  # POST /Buildings
  def create
    @building = Building.new(building_params)
    authorize @building, :create?

    if @building.save
      Role.create!(name: building_params[:name], reference_type: 'building', associated_id: @building.id)
      render json: @building, status: :created, location: @building
    else
      render json: @building.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /Buildings/1
  def update
    authorize @building, :update?
    if @building.update(building_params)
      render json: @building
    else
      render json: @building.errors, status: :unprocessable_entity
    end
  end

  # DELETE /Buildings/1
  def destroy
    authorize @building, :destroy?
    @building.destroy

    role = Role.find_by(associated_id: params[:id])
    role.destroy
  end

  private

  def set_building
    @building = Building.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def building_params
    params.permit(:name)
  end
end
