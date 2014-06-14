class AddReferencesToOrderAndOrderLines < ActiveRecord::Migration
    def change
        add_reference :order_lines, :order, index: true

        add_reference :order_lines, :product, index: true

        add_reference :orders, :customer, index: true

    end
end
