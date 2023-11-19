# frozen_string_literal: true

class DeleteAccountsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :accounts
  end
end
