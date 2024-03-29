class Logbook < ActiveRecord::Base
  has_many :visits

  validates :first_name, :second_name, presence: true
  validates :credential, :photo, attachment_presence: true

  has_attached_file :credential,
                    styles: { medium: "250x300>", thumb: "150x200>" }
  validates_attachment_content_type :credential,
                                    content_type: /\Aimage\/.*\Z/

  has_attached_file :photo,
                    styles: { medium: "250x300>", thumb: "150x200>" }
  validates_attachment_content_type :photo,
                                    content_type: /\Aimage\/.*\Z/

  def full_name
    "#{self.first_name} #{self.second_name}"
  end

  class << self
    def search(search)
      where("first_name ILIKE ?", "%#{search}%")
    end

    def very_active
      find(Visit.maximum(:logbook_id))
    end
  end
end
