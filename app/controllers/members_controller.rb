# frozen_string_literal: true

class MembersController < ApplicationController
  def show
    user = @current_user
    render json: user, include: :roles
  end
end
