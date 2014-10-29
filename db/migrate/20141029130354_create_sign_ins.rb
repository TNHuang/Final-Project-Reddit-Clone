class CreateSignIns < ActiveRecord::Migration
  def change
    create_table :sign_ins do |t|
      t.integer :user_id, null: false
      t.string :session_token, null: false
      
      t.timestamps
    end
    remove_column :users, :session_token
    add_index :sign_ins, :session_token, unique: true
    add_index :sign_ins, :user_id
  end
end
