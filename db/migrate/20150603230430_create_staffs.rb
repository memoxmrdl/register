class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :name

      t.references :office
      t.timestamps null: false
    end
  end
end
