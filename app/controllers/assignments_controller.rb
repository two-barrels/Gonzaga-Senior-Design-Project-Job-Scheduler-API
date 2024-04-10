# frozen_string_literal: true

class AssignmentsController < ApplicationController
  before_action :set_assignments, only: %i[update destroy]

  # GET /Assignments
  def index
    @Assignments = Assignment.all
    render json: @Assignments
  end

  # GET /Assignments/1
  def show
    @Assignments_floors = Assignment.find_by(user_id: params[:id])
    render json: @Assignments_ids
  end

  # POST /Assignments
  def create
    @Assignments = Assignment.new(assignments_params)
    authorize @Assignments, :create?

    if @Assignments.save
      render json: @Assignments, status: :created, location: @Assignments
    else
      render json: @Assignments.errors, status: :unprocessable_entity
    end
  end

  # CUSTOM ROUTE
  def change_admin_status
    # pass id
    # fetch user from the id
    #
    @user = User.find(params[:id])
    if @user.admin?
      Assignment.find_by(user_id: params[:id], role_id: Role.find_by(name: 'Admin').id).destroy
    else
      Assignment.create(user_id: params[:id], role_id: Role.find_by(name: 'Admin').id)
    end
  end

  # PATCH/PUT /Spaces/1
  def update
    authorize @Assignments, :update?
    if @Assignments.update(assignments_params)
      render json: @Assignments
    else
      render json: @Assignments.errors, status: :unprocessable_entity
    end
  end

  # DELETE /Spaces/1
  def destroy
    authorize @assignments, :destroy?
    @assignments.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_assignments
    @assignments = Assignment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def assignments_params
    params.permit(:id, :user_id, :role_id)
  end
end
