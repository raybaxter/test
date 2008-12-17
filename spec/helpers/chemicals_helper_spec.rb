require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ChemicalsHelper do
  describe "#all_vendors" do
    it "should return Vendors.find(:all)" do
      vendors = [:vendor1,:vendor2]
      Vendor.stub!(:find).with(:all).and_return(vendors)
      helper.all_vendors.should == vendors
    end
  end
  
  describe "#last_full_use_date_column" do
    it "should return an empty string if Chemical#last_usable_date returns nil " do
      obj = Object.new
      obj.stub!(:last_usable_date).and_return(nil)
      helper.last_full_use_date_column(obj).should == ''
    end
    
    it "should return the date string that Chemical#last_usable_date returns" do
      date = Date.today
      obj = Object.new
      obj.stub!(:last_usable_date).and_return(date)
      helper.last_full_use_date_column(obj).should == date
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
