class SwitchFromAccountToUser < ActiveRecord::Migration[7.0]
  def change
    rename_column :reservations, :account_id, :user_id
  end
end
