class Tag < ActiveRecord::Base
  belongs_to :product

  validates :uid, presence: true, uniqueness: true
  validates :rid, presence: true
end
