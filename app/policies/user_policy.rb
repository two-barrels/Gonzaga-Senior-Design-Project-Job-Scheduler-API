# frozen_string_literal: true

class UserPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def update?
    true
  end
end