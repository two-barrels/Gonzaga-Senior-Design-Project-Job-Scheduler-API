class BuildingPolicy < ApplicationPolicy
  def index?
    # Allow index action for all users
    true
  end

  def show?
    # Allow show action for all users
    true
  end

  def create?
    # Allow create action for all users
    true
  end

  def update?
    # Allow update action if user is an admin or the owner of the building
    true
  end

  def destroy?
    # Allow destroy action if user is an admin or the owner of the building
    true
  end
end
