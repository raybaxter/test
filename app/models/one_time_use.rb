class OneTimeUse < ChemicalUse
  validates_presence_of :use_date, :message => "required"
end
