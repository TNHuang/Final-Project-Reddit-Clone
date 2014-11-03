class Sub < ActiveRecord::Base
  include Votable

  validates :name, :title, :description, presence: true
  validates :name, :title, uniqueness: true

  has_many :moddings,
  class_name: "Modding",
  foreign_key: :sub_id,
  dependent: :destroy

  has_many :moderators, through: :moddings, source: :moderator

  has_many :subscriptions,
  class_name: "Subscription",
  foreign_key: :sub_id,
  dependent: :destroy

  has_many :subscribers, through: :subscriptions, source: :subscriber

  has_many :postings,
  class_name: "Posting",
  foreign_key: :sub_id,
  dependent: :destroy

  has_many :posts, through: :postings, source: :post

  has_many :user_votes, as: :votable,
  class_name: "UserVote",
  dependent: :destroy

  def votes
    self.user_votes.sum(:value)
  end

  def self.subscribers_count_by_sub
    subbers_by_sub = Hash.new { |h,k| h[k] =0 }
    subs_with_count = Sub
      .select("subs.*, COUNT(*) AS subbers_count")
      .joins(:subscribers)
      .group("subs.id");
    subs_with_count.each do |sub|
      subbers_by_sub[sub] = sub.subbers_count
    end
    subbers_by_sub
  end

  def self.votes_count_by_sub
    votes_by_sub = Hash.new { |h,k| h[k] =0 }

    votes_with_count = Sub
      .select("subs.*, sum(user_votes.value) AS votes_total")
      .joins(:user_votes)
      .group("subs.id");
    votes_with_count.each do |sub|
      votes_by_sub[sub] = sub.votes_total
    end
    votes_by_sub
  end

  def sub_with_posts_and_moderators
    moderators = self.moderators
    posts = self.posts
    [ posts, moderators ]
  end
  # def comments_by_parent
  #   comments_by_parent = Hash.new { |h,k| h[k] =[] }
  #   self.comments.includes(:author).each do |comment|
  #     comments_by_parent[comment.parent_comment_id] << comment
  #   end
  #
  #   comments_by_parent
  # end
  # def posts_by_sub
  #
  # end
  #

  #
  # def moderators_by_sub
  #
  # end

end
