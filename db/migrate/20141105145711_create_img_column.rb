class CreateImgColumn < ActiveRecord::Migration
  def up
    add_column :posts, :img_url, :text
  end
  def down
    remove_column :posts, :img_url
  end
end
