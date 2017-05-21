class RemoveImageFromProduct < ActiveRecord::Migration[5.0]
  def change
  	remove_column :products, :image
  end
end
