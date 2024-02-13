# frozen_string_literal: true

class RolePolicy < ApplicationPolicy

  def index?
    user.admin?
  end

  def show?
    user.admin?
  end
end