class Office < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :visit
  has_many :staff

  validates :name, presence: true, uniqueness: true
end
