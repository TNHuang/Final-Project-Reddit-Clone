class ChangePostsTitleLength < ActiveRecord::Migration
  def change
    remove_column :posts, :title
    add_column :posts, :title, :text
    add_index :posts, :title
  end
end
