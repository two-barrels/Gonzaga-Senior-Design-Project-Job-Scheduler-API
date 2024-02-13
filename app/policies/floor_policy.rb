# frozen_string_literal: true

class FloorPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end
end