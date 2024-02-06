# frozen_string_literal: true

class MembersController < ApplicationController

  def show
    user = current_user
    render json: {
      message: "If you see this, you're in!",
      user:
    }
  end
end
