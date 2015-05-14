class Office < ActiveRecord::Base
  has_many :visit

  validates :name, presence: true, uniqueness: true
end
