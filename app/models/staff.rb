class Staff < ActiveRecord::Base
  default_scope { order('created_at DESC') }

  belongs_to :office
end
