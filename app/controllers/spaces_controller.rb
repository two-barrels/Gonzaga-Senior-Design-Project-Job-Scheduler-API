class SpacesController < ApplicationController
    before_action :set_spaces, only: %i[update destroy ]
  
    # GET /Spaces
    def index
      @Spaces = Space.all
      render json: @Spaces
    end
  
    # GET /Spaces/1
    def show
      @Spaces_floors = Space.select(:floor_name).distinct.order(:floor_name)
      render json: @Spaces_floors 
    end
  
    # POST /Spaces
    def create
      @Spaces = Space.new(spaces_params)
  
      if @Spaces.save
        render json: @Spaces, status: :created, location: @Spaces
      else
        render json: @Spaces.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /Spaces/1
    def update
      if @Spaces.update(spaces_params)
        render json: @Spaces
      else
        render json: @Spaces.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /Spaces/1
    def destroy
      @Spaces.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_spaces
        @Spaces = Space.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def spaces_params
        params.permit(:spaces_name, :floor_name, :max_occupancy, :description)
      end
  end