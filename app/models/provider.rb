class Provider < ActiveRecord::Base
  belongs_to :address, :dependent => :destroy
  accepts_nested_attributes_for :address, allow_destroy: true

  has_and_belongs_to_many :products

  validates :name, presence: true
  validates :vat,  presence: true
end
