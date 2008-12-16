class ScheduledUse < ChemicalUse
  validates_presence_of :start_date, :message => "required"
  validates_presence_of :periodicity_type, :message => "required"
  validates_presence_of :periodicity_value, :message => "required"
  
  
end
