class AddVariantIdToProductId < ActiveRecord::Migration[5.0]
  def change
    add_column :product_lists, :variant_id, :integer
  end
end
