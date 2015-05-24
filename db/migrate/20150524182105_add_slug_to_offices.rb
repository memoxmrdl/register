class AddSlugToOffices < ActiveRecord::Migration
  def change
    add_column :offices, :slug, :string
    add_index :offices, :slug, unique: true
  end
end
