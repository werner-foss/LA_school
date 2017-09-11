class AddPositionToKids < ActiveRecord::Migration[5.0]
  def change
    add_column :kids, :position, :integer
  end
end
