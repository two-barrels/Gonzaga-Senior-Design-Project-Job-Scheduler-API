# frozen_string_literal: true

class UserPolicy
  attr_reader :user

  def initialize(user, post)
    @user = user
    @post = post
  end

  def create?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end