class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.datetime :register_at, null: false

      t.references :logbook
      t.timestamps null: false
    end
  end
end
