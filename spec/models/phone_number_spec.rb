require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PhoneNumber do
  
  describe "#strip" do
    it "should remove hyphens from phone numbers" do
      PhoneNumber.strip("123-456-7890").should == 1234567890
    end
    
    it "should remove open and close parens from phone numbers" do
      PhoneNumber.strip("(123)456-7890").should == 1234567890
    end
    
    it "should remove white spaces from phone numbers" do
      PhoneNumber.strip("(123) 456-7890\t").should == 1234567890
    end
    
    it "should return an integer value when passed a string" do
      PhoneNumber.strip("(123) 456-7890").should == 1234567890
    end
    
    it "should return nil when passed nil" do
      PhoneNumber.strip(nil).should be_nil
    end
    
    it "should return an integer when passed an integer" do
      PhoneNumber.strip(12345).should == 12345
    end
    
    it "should return nil when passed an empty string" do
      PhoneNumber.strip('').should be_nil
    end
    
    it "should return nil when passed non-integer, non-separator characters" do
      PhoneNumber.strip('123-456-7890x').should be_nil
    end    
    
    it "should raise error when passed anything but nil, String or Integer" do
      lambda { PhoneNumber.strip(Object.new) }.should raise_error
    end
    
  end

end
