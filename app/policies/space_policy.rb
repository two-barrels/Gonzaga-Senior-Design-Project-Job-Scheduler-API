# frozen_string_literal: true

class SpacePolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

end
