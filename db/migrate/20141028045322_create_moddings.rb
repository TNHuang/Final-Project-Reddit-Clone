class CreateModdings < ActiveRecord::Migration
  def change
    create_table :moddings do |t|
      #modding connect sub to user(moderators)
      t.integer :moderator_id, null: false
      t.integer :sub_id, null: false

      t.timestamps
    end

    add_index :moddings, [:moderator_id, :sub_id], :unique => true
  end
end
