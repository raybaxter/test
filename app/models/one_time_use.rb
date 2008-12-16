class OneTimeUse < ChemicalUse
  validates_presence_of :use_date, :message => "required"
  
  after_create :deduct_amount_from_chemical_amount
  
  def deduct_amount_from_chemical_amount
    chemical.amount -= amount
    chemical.save!
  end
end
