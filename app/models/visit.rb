class Visit < ActiveRecord::Base
  belongs_to :logbook
  belongs_to :office

  validates :register_at, presence: true
  validates_uniqueness_of :logbook_id, scope: :office_id, conditions: -> { where(output_at: nil) }

  scope :current_visits,
    -> { where(output_at: nil) }

  scope :past_visits,
    -> { where.not(output_at: nil) }
end
