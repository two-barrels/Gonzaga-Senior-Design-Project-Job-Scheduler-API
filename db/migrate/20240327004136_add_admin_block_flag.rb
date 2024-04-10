# frozen_string_literal: true

class AddAdminBlockFlag < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :admin_block, :boolean
  end
end
