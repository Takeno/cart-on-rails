class AddIndexProductAndCustomer < ActiveRecord::Migration
  def change
  	add_reference :orders, :customer, index: true
  	add_reference :order_Lines, :product, index: true
  end
end
