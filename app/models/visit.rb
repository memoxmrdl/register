class Visit < ActiveRecord::Base
  belongs_to :logbook
  has_one :office

  validates :register_at, presence: true
end
