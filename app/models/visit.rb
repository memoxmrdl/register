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

  scope :register_between,
    lambda {|start_date, end_date| where("register_at >= ? AND register_at <= ?", start_date, end_date )}

  scope :output_between,
    lambda {|start_date, end_date| where("output_at >= ? AND output_at <= ?", start_date, end_date )}

  class << self
    def search(a = nil, b = nil, c = nil, d = nil)
      if a.blank? && b.blank? && c.blank? && d.blank?
        all
      else
        where('(register_at >= ? AND register_at <= ?) OR office_id = ? OR logbook_id = ?', Time.parse(a), Time.parse(b), c, d)
      end
    end
  end
end
