class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.boolean :evaded

      t.timestamps
    end
  end
end
