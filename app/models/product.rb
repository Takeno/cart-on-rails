class Product < ActiveRecord::Base
	has_many :orderLines

    validates :name,  presence: true
    validates :description,  presence: true
    validates :price,  presence: true
    validates :quantity,  presence: true, numericality: {only_integer: true}
end
