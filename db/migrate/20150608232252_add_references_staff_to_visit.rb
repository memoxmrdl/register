class AddReferencesStaffToVisit < ActiveRecord::Migration
  def change
    add_reference :visits, :staff, index: true, foreign_key: true
  end
end
