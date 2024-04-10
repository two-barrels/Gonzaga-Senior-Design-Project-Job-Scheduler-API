# frozen_string_literal: true

class ReservationPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    @user.admin? || @user.id == @record.user_id
  end

  def destroy?
    @user.admin? || @user.id == @record.user_id
  end
end
