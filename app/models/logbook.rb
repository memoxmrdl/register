class Logbook < ActiveRecord::Base
  has_many :visits

  validates :first_name, :second_name, presence: true
end
