class Order < ActiveRecord::Base
	has_many :orderLines, dependent: :destroy
end
