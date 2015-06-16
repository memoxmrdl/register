class Visit < ActiveRecord::Base
  belongs_to :logbook
  belongs_to :office
  belongs_to :staff

  validates :register_at, presence: true
  validates_uniqueness_of :logbook_id, scope: :office_id, conditions: -> { where(output_at: nil) }

  scope :current_visits,
    -> { where('register_at::timestamp::date = ? AND output_at IS NULL', Time.zone.now.to_date) }

  scope :past_visits,
    -> { where('register_at::timestamp::date = ? AND output_at IS NOT NULL', Time.zone.now.to_date) }

  scope :by_period,
    -> started_at, ended_at { where("register_at >= ? AND output_at <= ?", started_at, ended_at) }

  scope :office,
    -> office { where(office_id: office) }

  scope :logbook,
    -> logbook { where(logbook_id: logbook) }
end
