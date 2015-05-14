class AddOutputAtToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :output_at, :datetime
  end
end
