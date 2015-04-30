class Office < ActiveRecord::Base
  belongs_to :visit

  validates :name, presence: true, uniqueness: true
end
