class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :subscriber_id, null: false
      t.integer :sub_id, null: false

      t.timestamps
    end

    add_index :subscriptions, [:subscriber_id, :sub_id], unique: true
  end
end
