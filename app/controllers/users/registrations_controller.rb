# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json
    before_action :valid_username_password?
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

    def valid_username_password?
      if params[:user][:password].length < 8 && 
        params[:user][:email].length < 10
        raise "invalid user data"
      end
    end
  end
end
