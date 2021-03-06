require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Vendor do
  def valid_vendor_attributes 
    { :name => "Company Name", 
      :phone_number => 5555551212,
      :email_address => "info@example.com",
      :website_url => "www.example.com"
    }.extend(HashExtension)  
  end
  
  before(:all) do
    # WebsiteUrl requires live Internet connection
    WebsiteUrl.stub!(:validate).with('www.example.com').and_return(true)
  end

  describe "#create" do
    it "should create a vendor" do
      lambda { Vendor.create!(valid_vendor_attributes) }.should_not raise_error
    end

    it "should properly assign all attributes" do
      vendor = Vendor.create!(valid_vendor_attributes)
      valid_vendor_attributes.keys.each do |attr| 
        vendor.send(attr).should == valid_vendor_attributes[attr]
      end
    end
  end

  describe "validate name" do
    it "should require a name" do
      vendor = Vendor.new(valid_vendor_attributes.except(:name))
      vendor.should_not be_valid
    end
  end
  
  describe "validate contact information" do
    before(:each) do
      @vendor = Vendor.new(:name => "Big Co, Inc")
    end

    it "must have some kind of contact info" do
      @vendor.should_not be_valid
    end
    
    it "should be valid with phone number only" do
      @vendor.phone_number = '1234567890'
      @vendor.should be_valid
      @vendor.save!
      @vendor.phone_number.should == '1234567890'    
    end
    
    it "should accept a phone number formatted with hyphens" do
      @vendor.phone_number = '123-456-7890'
      @vendor.save!
      @vendor.phone_number.should == '1234567890'
    end
    
    it "should be valid with an email address only" do
      @vendor.email_address = "joe@bigco.com"
      @vendor.should be_valid
    end
    
    it "should be valid with only a valid url" do
      @vendor.website_url = "www.example.com"
      @vendor.should be_valid
    end
    
    it "should not be valid with only a blank phone" do
      @vendor.phone_number = ""
      @vendor.should_not be_valid
    end

    it "should not be valid with only a blank email address" do
      @vendor.email_address = ""
      @vendor.should_not be_valid
    end

    it "should not be valid with only a blank website url" do
      @vendor.website_url = ""
      @vendor.should_not be_valid
    end
        
  end  
  
  describe "associations" do
    before(:each) do
       @vendor = Vendor.create!(valid_vendor_attributes)
     end
    
    it "should have many chemicals" do
      chem1 = Chemical.new(:name => "name1")
      chem2 = Chemical.new(:name => "name2")
      @vendor.chemicals = [chem1,chem2]
      @vendor.chemicals.size.should == 2
    end
    
  end
  
end
