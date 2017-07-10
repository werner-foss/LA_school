class AddSlugToAdults < ActiveRecord::Migration[5.0]
  def change
    add_column :adults, :slug, :string
    add_index :adults, :slug, unique: true
  end
end
