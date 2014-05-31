class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :surname
      t.date :birthdate
      t.string :nickname
      t.string :password
      t.references :address, index: true

      t.timestamps
    end
  end
end