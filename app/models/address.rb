class Address < ActiveRecord::Base
    validates :street,  presence: true
    validates :city,    presence: true
    validates :state,   presence: true
    validates :nation,  presence: true
    validates :zipcode, presence: true, numericality: {only_integer: true}

    has_one :customer
    has_one :provider
end
