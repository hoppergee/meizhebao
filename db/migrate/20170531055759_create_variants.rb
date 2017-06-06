class CreateVariants < ActiveRecord::Migration[5.0]
  def change
    create_table :variants do |t|
    	t.integer :product_id, :index => true
    	t.string :size
    	t.string :color
    	t.integer :quantity
      	t.timestamps
    end
  end
end
