require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CasNumber do

  describe "self#valid?" do
    # 9*1+8*2+7*3+6*4+5*5+4*6+3*7+2*8+1*9 = 165

    it "should return true for valid CAS Numbers" do
      CasNumber.validate("1234567-89-5").should be_true
    end

    it "should return false for invalid CAS Numbers" do
      CasNumber.validate("1234567-89-0").should be_false
    end
  end

  describe "self#url_for" do
    it "should return the url corresponding to the chemical" do
      CasNumber.url_for("1234567-89-5").should == CasNumber::REGISTRY_URL_BASE + "/1234567-89-5"
    end

  end

  describe "#valid_format" do
    it "should return false for nil" do
      CasNumber.new(nil).valid_format.should be_false
    end

    it "should return false if number is an integer" do
      CasNumber.new(123456).valid_format.should be_false
    end

    it "should return false unless there are 3 groups of digits" do
      CasNumber.new("123456-7-89-5").valid_format.should be_false
      CasNumber.new("1234567-895").valid_format.should be_false
    end

    it "should return false if first group of digits is empty" do
      CasNumber.new("-123456789-5").valid_format.should be_false
    end

    it "should return false if first group of digits is more than 7 digits" do
      CasNumber.new("12345678-9-5").valid_format.should be_false
    end

    it "should return false unless there are two digits in the second group" do
      CasNumber.new("123456-7-8").valid_format.should be_false
      CasNumber.new("123456-789-5").valid_format.should be_false
    end

    it "should return false unless there is one check digit" do
      CasNumber.new("123456-78-95").valid_format.should be_false
      CasNumber.new("123456-789-").valid_format.should be_false
    end

  end

  describe "#valid_checksum" do
    it "should return true for a valid checksum" do
      CasNumber.new("1234567-89-5").valid_checksum.should be_true
    end

    it "should return false for an invalid checksum" do
      CasNumber.new("1234567-89-0").valid_checksum.should be_false
    end

  end
end
