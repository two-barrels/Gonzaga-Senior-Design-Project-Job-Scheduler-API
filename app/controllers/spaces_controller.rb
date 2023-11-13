class SpacesController < ApplicationController
    before_action :set_Spaces, only: %i[update destroy ]
  
    # GET /Spaces
    def index
      @Spaces = Space.all
      render json: @Spaces
    end
  
    # GET /Spaces/1
    def show
      @Spaces_floors = Space.select(:floor_id).distinct.order(:floor_id)
      render json: @Spaces_floors 
    end
  
    # POST /Spaces
    def create
      @Spaces = Spaces.new(Spaces_params)
  
      if @Spaces.save
        render json: @Spaces, status: :created, location: @Spaces
      else
        render json: @Spaces.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /Spaces/1
    def update
      if @Spaces.update(Spaces_params)
        render json: @Spaces
      else
        render json: @Spaces.errors, status: :unprocessable_entity
      end
    end

    def example
      @spaces_and_floors = Floor.where(params[:id]).joins(:space)
      render json: @spaces_and_floors
    end
  
    # DELETE /Spaces/1
    def destroy
      @Spaces.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_Spaces
        @Spaces = Spaces.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def Spaces_params
        params.require(:Spaces).permit(:name, :relationship)
      end
  end