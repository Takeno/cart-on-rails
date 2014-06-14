class Order < ActiveRecord::Base
	has_many :orderLines
end
