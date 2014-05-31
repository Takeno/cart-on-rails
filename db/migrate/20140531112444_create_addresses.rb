class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :nation
      t.string :zipcode
      # t.references :customer, index: true

      t.timestamps
    end
  end
end
