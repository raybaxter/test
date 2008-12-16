require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OneTimeUse do
  before(:all) do
    @vendor = Vendor.create!(:name => "Vendor Name", :email_address => "e@a.com")
    @chemical = Chemical.create!(:name => "Chemical Name", :vendor => @vendor, :original_amount => 300, :unit => "L")
  end

  def valid_attributes
    { :chemist => "name",
      :amount => "1",
      :chemical_id => @chemical.id,
      :use_date => Date.today,
    }.extend(HashExtension)  
  end

  describe "#create with valid attributes" do    
    it "should create a new instance given valid attributes" do
      ChemicalUse.create!(valid_attributes)
    end

    it "should properly assign all attributes" do
      chemical_use = ChemicalUse.create!(valid_attributes)
      valid_attributes.keys.each do |attr| 
        chemical_use.send(attr).to_s.should == valid_attributes[attr].to_s
      end
    end
  end
  
  describe "validations" do
    it "should require a chemist" do
      use = OneTimeUse.new(valid_attributes.except(:chemist))
      use.should_not be_valid
    end
    
    it "should require an amount" do
      use = OneTimeUse.new(valid_attributes.except(:amount))
      use.should_not be_valid
    end
    
    it "should require an integer amount" do
      use = OneTimeUse.new(valid_attributes)
      use.amount = "10gms"
      use.should_not be_valid
    end
    
    it "should require an associated chemical" do
      use = OneTimeUse.new(valid_attributes.except(:chemical_id))
      use.should_not be_valid
    end
    
    it "should require a use date" do
      use = OneTimeUse.new(valid_attributes.except(:use_date))
      use.should_not be_valid
    end

  end

end
