class Staff < ActiveRecord::Base
  default_scope { order('created_at DESC') }

  has_one :position
  belongs_to :office
end
