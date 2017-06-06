class AddVariantIdToCartItems < ActiveRecord::Migration[5.0]
  def change
    add_column :cart_items, :variant_id, :integer
  end
end
