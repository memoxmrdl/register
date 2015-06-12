class Staff < ActiveRecord::Base
  default_scope { order('created_at DESC') }

  belongs_to :office

  has_one :visit

  class << self
    def more_visited
      find(Visit.maximum(:staff_id))
    end
  end
end
