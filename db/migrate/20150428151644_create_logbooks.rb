class CreateLogbooks < ActiveRecord::Migration
  def change
    create_table :logbooks do |t|
      t.string :first_name, null: false
      t.string :second_name, null: false

      t.timestamps null: false
    end
  end
end
