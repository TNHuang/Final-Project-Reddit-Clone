class Post < ActiveRecord::Base
  include Votable
  
  validates :title, :author_id, presence: true

  belongs_to :author,
  class_name: "User",
  foreign_key: :author_id

  has_many :postings,
  class_name: "Posting",
  foreign_key: :post_id

  has_many :subs, through: :postings, source: :sub
  #cross posting only

  has_many :comments, inverse_of: :post
  
  has_many :user_votes, as: :votable,
  class_name: "UserVote",
  dependent: :destroy

  def votes
    self.user_votes.sum(:value)
  end
  
  def comments_by_parent
    comments_by_parent = Hash.new { |h,k| h[k] =[] }
    
    self.comments.includes(:author).each do |comment|
      comments_by_parent[comment.parent_comment_id] << comment
    end
    
    comments_by_parent
  end
end
