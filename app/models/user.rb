# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable,
         :jwt_cookie_authenticatable,
         jwt_revocation_strategy: JwtDenylist
  has_many :assignments
  has_many :roles, through: :assignments
  has_many :reservations

  def role?(role)
    roles.any? { |r| r.name == role }
  end

  def admin?
    roles.any? { |r| r.name == 'Admin' }
  end
end
