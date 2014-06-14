class CreateOrderLines < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
      t.integer :quantity
      t.float :unitPrice

      t.timestamps
    end
  end
end
