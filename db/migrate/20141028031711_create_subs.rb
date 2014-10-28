class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.string :name, null: false
      t.string :title, null: false
      t.text :description, null: false

      t.timestamps
    end

    add_index :subs, :name, unique: true
    add_index :subs, :title, unique: true
  end
end
