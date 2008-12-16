class ChemicalUse < ActiveRecord::Base
  validates_presence_of :chemist, :message => "can't be blank"
  validates_presence_of :amount, :message => "can't be blank"
  validates_numericality_of :amount, :message => "is not a number"
  validates_presence_of :chemical, :message => "is required for each usage"
  
  belongs_to :chemical
end
