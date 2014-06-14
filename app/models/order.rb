class Order < ActiveRecord::Base
	has_many :orderLines
	belongs_to :customer
end
