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

  def self.search(a = nil, b = nil, c = nil, d = nil)
    if a.blank? && b.blank? && c.blank? && d.blank?
      all
    else
      where('register_at::timestamp::date = ? OR output_at::timestamp::date = ? OR office_id = ? OR logbook_id = ?', a, b, c, d)
    end
  end
end
