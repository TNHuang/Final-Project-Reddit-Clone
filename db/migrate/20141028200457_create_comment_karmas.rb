class CreateCommentKarmas < ActiveRecord::Migration
  def change
    create_table :comment_karmas do |t|
      t.integer :author_id, null: false
      t.integer :comment_id, null: false
      t.integer :value, null: false

      t.timestamps
    end

    add_index :comment_karmas, :comment_id
    add_index :comment_karmas, :author_id
    add_index :comment_karmas, [:comment_id, :author_id], unique: true
  end
end
