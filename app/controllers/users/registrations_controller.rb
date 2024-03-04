# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json
    skip_before_action :authenticate_user

    private

    def respond_with(resource, _opts = {})
      register_success && return if resource.persisted?

      register_failed
    end

    def register_success
      render json: current_user, include: :roles
    end

    def register_failed
      render json: { message: 'Something went wrong.' }, status: :unprocessable_entity
    end
  end
end
