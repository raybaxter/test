require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ChemicalsHelper do
  describe "#all_vendors" do
    it "should return Vendors.find(:all)" do
      vendors = [:vendor1,:vendor2]
      Vendor.stub!(:find).with(:all).and_return(vendors)
      helper.all_vendors.should == vendors
    end
  end
  
  describe "#link_for_cas_number" do
    it "should return the link corresponding to a CAS #" do
      helper.link_for_cas_number("1234567-89-5").should == link_to( "1234567-89-5", CasNumber::REGISTRY_URL_BASE + "/1234567-89-5")
    end
    
    it "should return blank for empty CAS #" do
      helper.link_for_cas_number("").should == ""
    end
    
    it "should return blank for nil CAS #" do
      helper.link_for_cas_number(nil).should == ""
    end
    
    
  end
  
end
