class Chemical < ActiveRecord::Base
  validates_presence_of :name, :message => "can't be blank"
  validates_presence_of :amount, :message => "can't be empty"
  validates_presence_of :unit, :message => "can't have an amount without a unit"
  validates_presence_of :vendor, :message => "is required for each chemical"
  belongs_to  :vendor
end
