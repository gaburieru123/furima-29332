class AddPasswordToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :encrypted_password_confirmation, :string, null: false

  end
end
