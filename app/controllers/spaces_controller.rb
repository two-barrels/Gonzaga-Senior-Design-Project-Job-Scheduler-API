# frozen_string_literal: true

class SpacesController < ApplicationController
  before_action :set_spaces, only: %i[update destroy]

  # GET /Spaces
  def get_space_geo_by_floor
    @spaces = Space.where(floor_id: params[:floor_id]).includes(:space_geometry)
    render json: @spaces.as_json(include: :space_geometry)
  end

  def index
    @spaces = Space.all
    render json: @spaces
  end

  # GET /Spaces/1
  def show
    @Spaces_floors = Space.select(:floor_id).distinct.order(:floor_id)
    render json: @Spaces_floors, include: :space_geometry
  end

  # POST /Spaces
  def create
    @space = Space.new(spaces_params)
    authorize @space, :create?

    if @space.save
      unless Rails.env.test?
        Role.create!(name: spaces_params[:spaces_name], reference_type: 'space', associated_id: @space.id)
      end
      render json: @space, status: :created, location: @space
    else
      render json: @space.errors, status: :unprocessable_entity
    end
  end
  
  def spaces_by_ids
    @spaces = Space.where(id: params[:space_ids])
    render json: @spaces
  end

  def by_floor
    @space = Space.where(floor_id: params[:floor_ids])
    render json: @space
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
    unless Rails.env.test?
      role = Role.find_by(associated_id: params[:id])
      role.destroy
    end
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
