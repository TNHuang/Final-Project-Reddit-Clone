class Sub < ActiveRecord::Base
  validates :name, :title, :description, presence: true
  validates :name, :title, uniqueness: true

  has_many :moddings,
  class_name: "Modding",
  foreign_key: :sub_id,
  dependent: :destroy

  has_many :moderators, through: :moddings, source: :moderator

  has_many :subscriptions,
  class_name: "Subscription",
  foreign_key: :sub_id

  has_many :subscribers, through: :subscriptions, source: :subscriber

  has_many :postings,
  class_name: "Posting",
  foreign_key: :sub_id,
  dependent: :destroy

  has_many :posts, through: :postings, source: :post

end
