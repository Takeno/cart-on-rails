class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :quantity
      t.references :product, index: true
      t.references :customer, index: true

      t.timestamps
    end
  end
end
