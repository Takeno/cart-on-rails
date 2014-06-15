class Customer < ActiveRecord::Base
  belongs_to :address, :dependent => :destroy
  has_many :cartItems
  has_many   :orders

  validates :name,  presence: true
  validates :surname,  presence: true
  validates :birthdate,  presence: true
  validates :nickname,  presence: true
  validates :password,  presence: true

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