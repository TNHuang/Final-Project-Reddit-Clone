class Comment < ActiveRecord::Base
  include Votable
  
  validates :author_id, :post ,:body, presence: true

  belongs_to :author,
  class_name: "User",
  foreign_key: :author_id

  belongs_to :parent_comment,
  class_name: "Comment",
  foreign_key: :parent_comment_id

  has_many :child_comments,
  class_name: "Comment",
  foreign_key: :parent_comment_id

  belongs_to :post, inverse_of: :comments
  
  has_many :user_votes, as: :votable,
  class_name: "UserVote",
  dependent: :destroy
  
  def votes
    self.user_votes.sum(:value)
  end
end