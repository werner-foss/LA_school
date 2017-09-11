class AddPositionToAdults < ActiveRecord::Migration[5.0]
  def change
    add_column :adults, :position, :integer
  end
end
