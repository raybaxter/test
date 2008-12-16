require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Chemical do
  
  before(:each) do
    @vendor = Vendor.create!(:name => "Test Co", :email_address => "joe@example.com")    
  end
  
  def valid_chemical_attributes 
    { :name => "Test Chemical", 
      :cas_number => "1234567-89-5",
      :original_amount => 300,
      :unit => "mL",
      :vendor => @vendor
    }.extend(HashExtension)  
  end
  
  def use_attributes
    {  :chemist => "name",
       :amount => "1",
       :chemical_id => @chemical.id,
       :use_date => Date.today,
       :start_date => Date.today,
       :end_date => Date.today,
       :periodicity_type => "Weekly",
       :periodicity_value => "1"
     }.extend(HashExtension)
  end
  
  describe "#create with valid attributes" do    
    it "should create a new instance given valid attributes" do
      Chemical.create!(valid_chemical_attributes)
    end
    
    it "should properly assign all attributes" do
      chemical = Chemical.create!(valid_chemical_attributes)
      valid_chemical_attributes.keys.each do |attr| 
        chemical.send(attr).should == valid_chemical_attributes[attr]
      end
    end
    
  end
  
  describe "validations" do
    it "should require a name" do
      chemical = Chemical.new(valid_chemical_attributes.except(:name))
      chemical.should_not be_valid
    end

    it "should require an original_amount" do
      chemical = Chemical.new(valid_chemical_attributes.except(:original_amount))
      chemical.should_not be_valid
    end
    
    it "should require an integer original_amount" do
      chemical = Chemical.new(valid_chemical_attributes)
      chemical.original_amount = "10gms"
      chemical.should_not be_valid
    end
    
    it "should require a unit" do
      chemical = Chemical.new(valid_chemical_attributes.except(:unit))
      chemical.should_not be_valid
    end
    
    it "should require a vendor" do
      chemical = Chemical.new(valid_chemical_attributes.except(:vendor))
      chemical.should_not be_valid
    end
    
    it "should have a valid CAS #, or none at all" do
      chemical = Chemical.new(valid_chemical_attributes.except(:cas_number))
      chemical.should be_valid
      
      chemical.cas_number = "0-00-1"
      chemical.should_not be_valid
    end
    
  end
  
  describe "associations" do
    before(:each) do
      @chemical = Chemical.create!(valid_chemical_attributes)
    end
    
    it "should have access to the vendor#name" do
      @chemical.vendor.should_not be_nil
      @chemical.vendor.name.should_not be_nil
    end
    
    it "should have associations to one_time_uses" do
      @chemical.one_time_uses.size.should == 0
      use1 = OneTimeUse.create!(use_attributes.merge(:chemical => @chemical, :amount => 100))
      use2 = OneTimeUse.create!(use_attributes.merge(:chemical => @chemical, :amount => 100))
      chemical = Chemical.find(@chemical)
      chemical.one_time_uses.size.should == 2
      chemical.one_time_uses.should == [use1,use2]
    end
    
    it "should have associations to scheduled_uses" do
       @chemical.scheduled_uses.size.should == 0
       use1 = ScheduledUse.create!(use_attributes.merge(:chemical => @chemical, :amount => 100))
       use2 = ScheduledUse.create!(use_attributes.merge(:chemical => @chemical, :amount => 100))
       chemical = Chemical.find(@chemical)
       chemical.scheduled_uses.size.should == 2
       chemical.scheduled_uses.should == [use1,use2]
     end
    
  end
  
  describe "#current_amount" do
    before(:each) do
      @chemical = Chemical.create!(valid_chemical_attributes)
    end

    it "should be the original amount if no uses have occurred" do
      @chemical.original_amount.should == 300
      @chemical.current_amount.should == 300
    end
    
    it "should be the original amount reduced by one-time use" do
      OneTimeUse.create!(use_attributes.merge(:chemical => @chemical, :amount => 100))
      @chemical.original_amount.should == 300
      @chemical.current_amount.should == 200
    end
    
    it "should be the original amount reduced by multiple one-time uses" do
      OneTimeUse.create!(use_attributes.merge(:chemical => @chemical, :amount => 100))
      OneTimeUse.create!(use_attributes.merge(:chemical => @chemical, :amount => 100))
      @chemical.original_amount.should == 300
      @chemical.current_amount.should == 100
    end
   
    it "should be the original amount reduced by past recurrent use" do
      ScheduledUse.create!(use_attributes.merge(:chemical => @chemical, :amount => 100))
      @chemical.original_amount.should == 300
      @chemical.current_amount.should == 200
    end
    
    it "should be the original amount reduced by past recurrent uses" do
      ScheduledUse.create!(use_attributes.merge(:chemical => @chemical, :amount => 100))
      ScheduledUse.create!(use_attributes.merge(:chemical => @chemical, :amount => 10, :start_date => Date.today - 70))
      @chemical.original_amount.should == 300
      @chemical.current_amount.should == 90
    end
    
    it "should be the original amount reduced by multiple one-time uses and multiple past recrrent uses" do
      OneTimeUse.create!(use_attributes.merge(:chemical => @chemical, :amount => 10))
      OneTimeUse.create!(use_attributes.merge(:chemical => @chemical, :amount => 10))
      ScheduledUse.create!(use_attributes.merge(:chemical => @chemical, :amount => 100))
      ScheduledUse.create!(use_attributes.merge(:chemical => @chemical, :amount => 10, :start_date => Date.today - 70))
      @chemical.original_amount.should == 300
      @chemical.current_amount.should == 70
    end
    
    
  end
  
end
