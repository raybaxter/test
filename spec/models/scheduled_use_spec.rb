require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ScheduledUse do
  before(:all) do
    @vendor = Vendor.create!(:name => "Vendor Name", :email_address => "e@a.com")
    @chemical = Chemical.create!(:name => "Chemical Name", :vendor => @vendor, :original_amount => 300, :unit => "L")
  end

  def valid_attributes
    {
      :chemist => "name",
      :amount => "1",
      :chemical_id => @chemical.id,
      :start_date => Date.today,
      :end_date => Date.today+30,
      :periodicity_type => "value for periodicity_type",
      :periodicity_value => "1"
    }.extend(HashExtension)  
  end

  describe "#create with valid attributes" do    
    it "should create a new instance given valid attributes" do
      ScheduledUse.create!(valid_attributes)
    end

    it "should properly assign all attributes" do
      chemical_use = ScheduledUse.create!(valid_attributes)
      valid_attributes.keys.each do |attr| 
        chemical_use.send(attr).to_s.should == valid_attributes[attr].to_s
      end
    end
  end
  
  describe "periodicity" do
    # - A schedule use's periodicity can be weekly (on a particular day of the week), monthly (on a particular day of the month), or every N business days (don't worry about dealing with holidays, just ignore weekends)
    it "should work according to specification" do
      pending("Needs to be written")
    end
    
  end

  describe "validations" do
    it "should require a chemist" do
      use = ScheduledUse.new(valid_attributes.except(:chemist))
      use.should_not be_valid
    end
    
    it "should require an amount" do
       use = ScheduledUse.new(valid_attributes.except(:amount))
       use.should_not be_valid
     end
    
     it "should require an integer amount" do
       use = ScheduledUse.new(valid_attributes)
       use.amount = "10gms"
       use.should_not be_valid
     end
     
     it "should require an associated chemical" do
       use = ScheduledUse.new(valid_attributes.except(:chemical_id))
       use.should_not be_valid
     end
     
     it "should require a start date" do
       use = ScheduledUse.new(valid_attributes.except(:start_date))
       use.should_not be_valid
     end
    
     it "should require a periodicity_type" do
       use = ScheduledUse.new(valid_attributes.except(:periodicity_type))
       use.should_not be_valid
     end

     it "should require a periodicity_value" do
       use = ScheduledUse.new(valid_attributes.except(:periodicity_value))
       use.should_not be_valid
     end

  end
  
end
