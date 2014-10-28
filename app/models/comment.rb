class Comment < ActiveRecord::Base
  validates :author_id, :post_id ,:body, presence: true

  belongs_to :author,
  class_name: "User",
  foreign_key: :author_id

  belongs_to :parent_comment,
  class_name: "Comment",
  foreign_key: :parent_comment_id

  has_many :child_comments,
  class_name: "Comment",
  foreign_key: :parent_comment_id

  belongs_to :post,
  class_name: "Post",
  foreign_key: :post_id
end