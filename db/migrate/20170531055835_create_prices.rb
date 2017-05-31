class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
    	t.integer :variant_id
    	t.decimal :current, precision: 10, scale: 2
    	t.decimal :origin, precision: 10, scale: 2
      t.timestamps
    end
  end
end
