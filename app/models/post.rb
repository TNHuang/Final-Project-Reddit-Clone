class Post < ActiveRecord::Base
  validates :title, :author_id, presence: true



  belongs_to :author,
  class_name: "User",
  foreign_key: :author_id

  has_many :postings,
  class_name: "Posting",
  foreign_key: :post_id

  has_many :subs, through: :postings, source: :sub
  #cross posting only
end
