class DeleteProductIdFromCartItems < ActiveRecord::Migration[5.0]
  def change
  	remove_column :cart_items, :product_id
  end
end
