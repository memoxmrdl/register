class Visit < ActiveRecord::Base
  include Visitable

  belongs_to :logbook
  belongs_to :office
  belongs_to :staff

  validates :register_at, presence: true
  validates_uniqueness_of :logbook_id, scope: :office_id, conditions: -> { where(output_at: nil) }
end
