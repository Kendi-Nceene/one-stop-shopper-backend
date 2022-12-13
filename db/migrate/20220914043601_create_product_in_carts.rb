class CreateProductInCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :product_in_carts do |t|
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end
end
