class Visit < ActiveRecord::Base
  belongs_to :logbook
  has_one :office
end
