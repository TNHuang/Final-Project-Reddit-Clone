class Modding < ActiveRecord::Base
  validates :moderator_id, :sub_id, presence: true
  validates_uniqueness_of :moderator_id, :sub_id

  belongs_to :sub,
  class_name: "Sub",
  foreign_key: :sub_id

  belongs_to :moderator,
  class_name: "User",
  foreign_key: :moderator_id
end
