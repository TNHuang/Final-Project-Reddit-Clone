class Post < ActiveRecord::Base
  include Votable
  include PgSearch


  geocoded_by :address

  after_validation :geocode, :if => :address_changed?


  after_create :save_img_url

  validates :title, :author_id, presence: true

  multisearchable :against => [:body, :title]

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

  def self.votes_count_by_post(sub)
    votes_by_post = Hash.new { |h,k| h[k] = 0 }

    votes_with_post = sub.posts
      .select("posts.*, sum(user_votes.value) AS votes_total")
      .joins(:user_votes)
      .group("posts.id");
    votes_with_post.each do |post|
      votes_by_post[post] = post.votes_total
    end
    votes_by_post
  end

  def self.author_by_post_sub(sub)
    author_by_post = Hash.new { |h,k| h[k] ="" }

    sub.posts.each do |post|
      author_by_post[post] = post.author
    end
    author_by_post
  end

  def get_post_img_src
    begin

      if self.url =~ /.gif/
        return ""
      elsif self.url =~ /(.jpg)|(.png)/
        return self.url
      else

        main_url =  self.url.match(/(http:\/\/www.*.org)|(https:\/\/www.*.org)|(http:\/\/www.*.com)|(https:\/\/www.*.com)/).to_a[0]
        page = Nokogiri::HTML(open(self.url)).css('img').to_a.sample
        src = page.attr('src');
        src = page.attr('data-src') if src =~ /^data:image/

        if src =~ /(static\/archives)|(public\/archives)/
          src = main_url + src
        end
        return "" if src =~ /.gif/ || src.length == 0
        (src =~ /(^https:\/\/)|(^http:\/\/)/ ? src : "https://#{src}")
      end

    rescue
      ""
    end
  end

  def author_by_post_comment
    author_by_post_comment = Hash.new {|h, k| h[k] = ""}
    comments = self.comments
    comments.each { |comment| author_by_post_comment[comment] = comment.author}
    author_by_post_comment
  end

  def votes_by_comment
    votes_by_comment = Hash.new {|h, k| h[k] = ""}
    comments = self.comments
    comments.each { |comment| votes_by_comment[comment] = comment.votes}
    votes_by_comment
  end

  def comments_by_parent
    comments_by_parent = Hash.new { |h,k| h[k] =[] }

    self.comments.includes(:author).each do |comment|
      comments_by_parent[comment.parent_comment_id] << comment
    end

    comments_by_parent
  end

  def save_img_url
    src = self.get_post_img_src
    self.img_url = src
    self.save
  end
end
