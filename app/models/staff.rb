class Staff < ActiveRecord::Base
  has_one :position
  belongs_to :office
end
