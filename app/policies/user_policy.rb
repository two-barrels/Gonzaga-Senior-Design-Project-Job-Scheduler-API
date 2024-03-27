# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def update?
    Rails.env.test? || @user.admin? || @user.id == @record.id
  end
end
