class User < ActiveRecord::Base
  attr_reader :password

  validates :name, :password_digest, presence: true
  validates :name, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true}

  has_many :subscriptions,
  class_name: "Subscription",
  foreign_key: :subscriber_id

  has_many :subs, through: :subscriptions, source: :sub

  has_many :moddings,
  class_name: "Modding",
  foreign_key: :moderator_id

  has_many :mod_subs, through: :moddings, source: :sub

  has_many :posts,
  class_name: "Post",
  foreign_key: :author_id

  has_many :comments,
  class_name: "Comment",
  foreign_key: :author_id

  has_many :sign_ins, inverse_of: :user

  has_many :user_votes,
  class_name: "UserVote",
  foreign_key: :user_id

  #perfect pig
  def get_karma
    post_karma, comment_karma= 0, 0

    self.user_votes.each do |user_vote|
      user_vote.votable_type == "Post" ?  post_karma += user_vote.value : comment_karma += user_vote.value
    end
    {post_karma: post_karma, comment_karma: comment_karma }
  end

  def votes
    self.user_votes.sum(:value)
  end

  def self.find_by_credentials(name, password)
    user = User.find_by_name(name);
    user && user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password);
  end


  def self.find_or_create_by(options)
      user = User.find_by(options)

      if user
        return user
      else
        options[:name] = "Facebook_login#{rand(400)}"
        options[:password] = SecureRandom.urlsafe_base64
        user = User.create(options)
      end
      user
    end

end
