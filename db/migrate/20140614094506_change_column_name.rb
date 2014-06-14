class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :orders, :completationDate, :evasionDate
  end
end
