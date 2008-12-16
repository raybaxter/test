require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ChemicalUse do
  before(:all) do
    @vendor = Vendor.create!(:name => "Vendor Name", :email_address => "e@a.com")
    @chemical = Chemical.create!(:name => "Chemical Name", :vendor => @vendor, :amount => 300, :unit => "L")
  end

  def valid_attributes
    {
      :chemist => "name",
      :amount => "1",
      :chemical_id => @chemical.id,
      :use_date => Date.today,
      :start_date => Date.today,
      :end_date => Date.today,
      :periodicity_type => "value for periodicity_type",
      :periodicity_value => "1"
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
  
end
