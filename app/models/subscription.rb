class Subscription < ActiveRecord::Base
  validates :subscriber_id, :sub_id, presence: true
  validates_uniqueness_of :subscriber_id, :scope => [:sub_id]

  belongs_to :sub,
  class_name: "Sub",
  foreign_key: :sub_id

  belongs_to :subscriber,
  class_name: "User",
  foreign_key: :subscriber_id
end
