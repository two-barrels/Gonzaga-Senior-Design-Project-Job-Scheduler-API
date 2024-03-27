class BuildingsController < ApplicationController

    # GET /Buildings
    def index
      @Buildings = Building.all
      render json: @Buildings
    end
  
    # GET /Buildings/1
    def show
      @Buildings_name = Building.select(:name)
      render json: @Building_name
    end
  
    # POST /Buildings
    def create
      @Buildings = Building.new(building_params)
      authorize @Buildings, :create?
  
      if @Buildings.save
        render json: @Buildings, status: :created, location: @Buildings
      else
        render json: @Buildings.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /Buildings/1
    def update
      authorize @Buildings, :update?
      if @Buildings.update(building_params)
        render json: @Buildings
      else
        render json: @Buildings.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /Buildings/1
    def destroy
      authorize @Buildings, :destroy?
      @Buildings.destroy
    end
  
    private
  
    # Only allow a list of trusted parameters through.
    def building_params
      params.permit(:name)
    end
end
