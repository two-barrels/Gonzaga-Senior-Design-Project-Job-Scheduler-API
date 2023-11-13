class CreateAccountTable < ActiveRecord::Migration[7.0]
  def up
    create_table :accounts do |t|
      t.string :name
      t.string :password
      t.string :email
    end
  end

  def down
    drop_table :accounts
  end
end
