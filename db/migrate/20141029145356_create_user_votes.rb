class CreateUserVotes < ActiveRecord::Migration
  def change
    create_table :user_votes do |t|
      t.integer :user_id, null: false
      t.integer :votable_id, null: false
      t.string :votable_type, null: false
      t.integer :value, null: false
      
      t.timestamps
    end
    
    add_index :user_votes, [:votable_id, :votable_type]
    add_index :user_votes, [:votable_id, :votable_type, :user_id], unique: true
  end
end
