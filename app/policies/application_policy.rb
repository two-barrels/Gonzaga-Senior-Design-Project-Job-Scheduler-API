# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    Rails.env.test? || @user.admin?
  end

  def show?
    Rails.env.test? || @user.admin?
  end

  def create?
    Rails.env.test? || @user.admin?
  end

  def new?
    create?
  end

  def update?
    Rails.env.test? || @user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    Rails.env.test? || @user.admin?
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    private

    attr_reader :user, :scope
  end
end
