class Comment < ActiveRecord::Base
  valdiates :author_id, :body, presence: true

  belongs_to :author,
  class_name: "User",
  foreign_key: :author_id

  belongs_to :parent_comment,
  class_name: "Comment",
  foreign_key: :parent_comment_id

  has_many :comments,
  class_name: "Comment",
  foreign_key: :parent_comment_id
end