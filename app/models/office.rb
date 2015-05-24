class Office < ActiveRecord::Base
  extend FriendlyId

  friendly_id :name, use: :slugged

  has_many :visit

  validates :name, presence: true, uniqueness: true
end
