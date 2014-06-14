class CreateColumnOrder < ActiveRecord::Migration
  def change
    add_column :orders, :evaded, :boolean
  end
end
