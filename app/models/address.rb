class Address < ActiveRecord::Base
    # validate :street,  presence: true
    # validate :city,    presence: true
    # validate :state,   presence: true
    # validate :nation,  presence: true
    # validate :zipcode, presence: true, numericality: {only_integer: true}

    has_one :customer
end
