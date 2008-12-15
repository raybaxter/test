class Chemical < ActiveRecord::Base
  validates_presence_of :name, :message => "can't be blank"
  validates_presence_of :amount, :message => "can't be empty"
  validates_presence_of :unit, :message => "can't have an amount without a unit"
  validates_presence_of :vendor, :message => "is required for each chemical"

  validates_presence_of :valid_cas_number, :message => "must have proper format and checksum if present",
                        :unless => :cas_number_empty

  belongs_to  :vendor

  def cas_number_empty
    cas_number.nil? or cas_number.blank?  
  end

  def valid_cas_number
    CasNumber.validate(cas_number)
  end

end
