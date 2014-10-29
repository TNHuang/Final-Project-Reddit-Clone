class DropKarmaTabls < ActiveRecord::Migration
  def change
    drop_table :comment_karmas
    drop_table :link_karmas
  end
end
