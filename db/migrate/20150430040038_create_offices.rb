class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.belongs_to :visit, index: true
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
