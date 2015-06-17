module Visitable
  extend ActiveSupport::Concern

  included do
    scope :current_register,
      -> { where('register_at::timestamp::date = ?', Time.zone.now.to_date).where(output_at: nil).reverse }

    scope :current_output,
      -> { where('register_at::timestamp::date = ?', Time.zone.now.to_date).where.not(output_at: nil).reverse }

    scope :past_register,
      -> { where('register_at::timestamp::date < ?', Time.zone.now.to_date).where(output_at: nil).reverse }

    scope :by_period,
      -> started_at, ended_at { where("register_at >= ? AND output_at <= ?", started_at, ended_at).where.not(output_at: nil) }

    scope :office,
      -> office { where(office_id: office).where.not(output_at: nil) }

    scope :logbook,
      -> logbook { where(logbook_id: logbook).where.not(output_at: nil) }

    scope :all_without_output, -> { all.where.not(output_at: nil) }

    scope :more_visited,
      -> item { select(item).group(item).having('count(*) > 1') }
  end
end