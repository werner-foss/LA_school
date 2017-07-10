class AddSmallImageToNews < ActiveRecord::Migration[5.0]
  def change
    add_column :news, :small_image, :text
  end
end
