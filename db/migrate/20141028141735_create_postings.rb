class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.integer :sub_id, null: false
      t.integer :post_id, null: false

      t.timestamps
    end
    add_index :postings, [:post_id, :sub_id], unique: true
  end
end
