require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Chemical do
  
  before(:each) do
    @vendor = Vendor.create!(:name => "Test Co", :email_address => "joe@example.com")    
  end
  
  def valid_chemical_attributes 
    { :name => "Test Chemical", 
      :cas_number => "1234567-89-5",
      :amount => 300,
      :unit => "mL",
      :vendor => @vendor
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

    it "should require an amount" do
      chemical = Chemical.new(valid_chemical_attributes.except(:amount))
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
  
end
