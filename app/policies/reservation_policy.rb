# frozen_string_literal: true

class ReservationPolicy
  attr_reader :user

  def initialize(user, post)
    @user = user
    @post = post
  end

end