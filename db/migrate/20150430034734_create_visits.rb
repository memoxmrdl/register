class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.belongs_to :logbook, index: true
      t.datetime :register_at, null: false

      t.timestamps null: false
    end
  end
end
