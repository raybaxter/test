class Chemical < ActiveRecord::Base
  validates_presence_of :name, :message => "can't be blank"
  validates_presence_of :original_amount, :message => "can't be empty"
  validates_numericality_of :original_amount, :message => "is not a number"
  validates_presence_of :unit, :message => "can't have an amount without a unit"
  validates_presence_of :vendor, :message => "is required for each chemical"

  validates_presence_of :valid_cas_number, :message => "must have proper format and checksum if present",
                        :unless => :cas_number_empty

  belongs_to  :vendor
  has_many :one_time_uses
  has_many :scheduled_uses

  def current_amount
    original_amount - one_time_amount_total - past_scheduled_uses_total
  end
  
  def one_time_amount_total
    one_time_uses.inject(0) { |sum, u| sum + u.amount }
  end
    # 
    # def initialize(start_date, type, interval=1)
    #    @start_date = start_date
    #    @type = type
    #    @interval = interval
    #  end
    # 
    #  def elapsed_periods
    #    
  def past_scheduled_uses_total
    total = 0
    scheduled_uses.each do |u|
      total += u.amount * Periodicity.new(u.start_date,u.periodicity_type,u.periodicity_value).elapsed_periods
    end
    total
  end
  
  def cas_number_empty
    cas_number.nil? or cas_number.blank?  
  end

  def valid_cas_number
    CasNumber.validate(cas_number)
  end

end
