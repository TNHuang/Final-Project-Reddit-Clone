class Post < ActiveRecord::Base
  validates :title, :author_id, presence: true
  validates :author_id, uniqueness: true


  # has_many :moddings,
  # class_name: "Modding",
  # foreign_key: :sub_id
  #
  # has_many :moderators, through: :moddings, source: :moderator
  #
  # has_many :subscriptions,
  # class_name: "Subscription",
  # foreign_key: :sub_id
  #
  # has_many :subscribers, through: :subscriptions, source: :subscriber

end
