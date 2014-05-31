class OrderLine < ActiveRecord::Base
	belogs_to :order
end
