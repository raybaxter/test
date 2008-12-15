require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ChemicalsHelper do
  describe "#all_vendors" do
    it "should return Vendors.find(:all)" do
      vendors = [:vendor1,:vendor2]
      Vendor.stub!(:find).with(:all).and_return(vendors)
      helper.all_vendors.should == vendors
    end
  end
  
end
