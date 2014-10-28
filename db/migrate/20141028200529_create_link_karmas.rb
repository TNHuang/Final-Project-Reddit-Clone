class CreateLinkKarmas < ActiveRecord::Migration
  def change
    create_table :link_karmas do |t|
      t.integer :author_id, null: false
      t.integer :link_id, null: false
      t.integer :value, null: false

      t.timestamps
    end

    add_index :link_karmas, :link_id
    add_index :link_karmas, :author_id
    add_index :link_karmas, [:link_id, :author_id], unique: true
  end
end
