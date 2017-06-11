class RemoveVariantIdFromProduct < ActiveRecord::Migration[5.0]
  def change
  	remove_column :products, :variant_id
  end
end
