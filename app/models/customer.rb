class Customer < ActiveRecord::Base
  belongs_to :address

  accepts_nested_attributes_for :address, allow_destroy: true

  def self.authenticate(nickname, password)
  	user = find_by_nickname(nickname)
  	if user && user.password == password
  		user
  	else
  		nil
  	end
  end
end