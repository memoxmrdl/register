class Visit < ActiveRecord::Base
  belongs_to :logbook
  belongs_to :office

  validates :register_at, presence: true
  validates :logbook_id, uniqueness: { scope: [:office] }

  scope :current_visits,
    -> { where('register_at > ?', Date.today).order('register_at DESC') }

  scope :past_visits,
    -> { where('register_at <= ?', Date.today).order('register_at DESC') }
end
