class ChangeUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_index :users, :session_token, unique: true
    rename_column :users, :password_token, :password_digest
  end
end
