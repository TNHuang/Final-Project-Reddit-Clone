class UserVote < ActiveRecord::Base
  validates :user, presence: true
  validates_uniqueness_of :user_id, :scope =>[ :votable_id, :votable_type ]
  
  belongs_to :votable, polymorphic: true
  belongs_to :user, inverse_of: :user_votes
end