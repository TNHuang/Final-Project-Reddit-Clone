class Posting < ActiveRecord::Base
  validates :post_id, :sub_id, presence: true
  validates_uniqueness_of :post_id, :scope =>[:sub_id]

  belongs_to :sub,
  class_name: "Sub",
  foreign_key: :sub_id

  belongs_to :post,
  class_name: "Post",
  foreign_key: :post_id
end
