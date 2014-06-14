class Provider < ActiveRecord::Base
  belongs_to :address, :dependent => :destroy

  accepts_nested_attributes_for :address, allow_destroy: true
end
