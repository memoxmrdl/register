class Visit < ActiveRecord::Base
  belongs_to :logbook
  belongs_to :office
  belongs_to :staff

  validates :register_at, presence: true
  validates_uniqueness_of :logbook_id, scope: :office_id, conditions: -> { where(output_at: nil) }

  scope :current_visits,
    -> { where('register_at::date = ? AND output_at IS NULL', DateTime.now.to_date) }

  scope :past_visits,
    -> { where('register_at::date = ? AND output_at IS NOT NULL', DateTime.now.to_date) }
end
