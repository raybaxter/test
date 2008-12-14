require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Vendor do
  def valid_vendor_attributes 
    { :name => "Company Name", 
      :phone_number => 5555551212,
      :email_address => "info@example.com",
      :website_url => "www.example.com"
    }.extend(HashExtension)  
  end

  describe "with valid attibutes" do
    before(:each) do
      @vendor = Vendor.create!(valid_vendor_attributes)
    end
    
    it "should create a vendor" do
       @vendor = Vendor.create!(valid_vendor_attributes)
     end

     it "should have a name" do
       @vendor.name.should == valid_vendor_attributes[:name]
     end

     it "should have a phone number" do
       @vendor.phone_number.should == valid_vendor_attributes[:phone_number]
     end

     it "should have an email address" do
       @vendor.email_address.should == valid_vendor_attributes[:email_address]
     end

     it "should have a website url" do
       @vendor.website_url.should == valid_vendor_attributes[:website_url]
     end
   end

  describe "validations" do
    it "should require a name" do
      vendor = Vendor.new(valid_vendor_attributes.except(:name))
      vendor.should_not be_valid
    end

    describe "contact information" do
      before(:each) do
        @vendor = Vendor.new(:name => "Big Co, Inc")
      end

      it "must have some kind of contact info" do
        @vendor.should_not be_valid
      end
      
      it "should be valid with phone number only" do
        @vendor.phone_number = '1234567890'
        @vendor.should be_valid
      end
      
      it "should be valid with an email address only" do
        @vendor.email_address = "joe@bigco.com"
        @vendor.should be_valid
      end
      
      it "should be valid with only the url of a registered domain name" do
        @vendor.website_url = "example.com"
        @vendor.should be_valid
      end
      
      it "should be valid with the url of a registered domain name beginning with 'http://" do
        @vendor.website_url = "http://example.com"
        @vendor.should be_valid
      end

      it "should be valid with the url of a registered domain name beginning with 'https://" do
        @vendor.website_url = "https://example.com"
        @vendor.should be_valid
      end
      
      it "should be valid with a url containing a path" do
        @vendor.website_url = "https://example.com/arbitrary/path?with=params&query=x"
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
      
      it "should not be valid with the url for an non-existent domain" do
        @vendor.website_url = "http://ifthisdomainisevercreatedthistestwillfail.com"
        @vendor.should_not be_valid
      end
      
      
    end

  end  
  
end
