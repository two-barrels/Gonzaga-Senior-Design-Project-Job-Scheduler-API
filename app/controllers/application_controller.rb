# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pundit::Authorization
  include ActionController::Cookies
  before_action :authenticate_user

  private

  def get_user_from_token
    jwt_payload = JWT.decode(cookies[:access_token],
    ENV['jwt_secret_key'].to_s).first
    user_id = jwt_payload['sub']
    User.find(user_id.to_s)
  end

  def authenticate_user
    if !Rails.env.test?
      auth_token = cookies[:access_token]
      if auth_token
        @current_user = get_user_from_token
        if !@current_user
          render json: { message: 'Hmm nothing happened.' }, status: :unauthorized
        end
      else
        render json: { message: 'Hmm nothing happened.' }, status: :unauthorized
      end
    end
  end
end
