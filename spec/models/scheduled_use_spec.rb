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
      :periodicity_type => Periodicity::WEEKLY,
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
    
     it "should require a periodicity_value if it has a daily repeat" do
       use = ScheduledUse.new(valid_attributes.except(:periodicity_value).merge(:periodicity_type=>Periodicity::BUSINESS_DAILY))
       use.should_not be_valid
     end

     it "should require a periodicity_type" do
       use = ScheduledUse.new(valid_attributes.except(:periodicity_type))
       use.should_not be_valid
     end

  end
  
end
