class AddRefProvidersToProducts < ActiveRecord::Migration
  def change
    create_table :products_providers, id: false do |t|
      t.belongs_to :product
      t.belongs_to :provider
    end    
  end
end
