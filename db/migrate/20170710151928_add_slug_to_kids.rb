class AddSlugToKids < ActiveRecord::Migration[5.0]
  def change
    add_column :kids, :slug, :string
    add_index :kids, :slug, unique: true
  end
end
