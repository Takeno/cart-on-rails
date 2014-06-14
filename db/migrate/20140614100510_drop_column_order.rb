class DropColumnOrder < ActiveRecord::Migration
  def change
  	remove_column :orders, :evasionDate
  end
end
