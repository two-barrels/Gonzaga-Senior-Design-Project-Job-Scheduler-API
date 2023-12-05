# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist
  has_many :assignments
  has_many :roles, through: :assignments

  def role?(role)
    roles.any? { |r| r.name.underscore.to_sym == role }
  end
end
