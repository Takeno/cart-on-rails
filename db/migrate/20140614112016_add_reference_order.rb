class AddReferenceOrder < ActiveRecord::Migration
  def change
  	add_index :order_Lines, :order_id
  end
end
