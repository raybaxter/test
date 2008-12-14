require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Chemical do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :cas_number => "value for cas_number",
      :amount => "1",
      :unit => "value for unit",
      :vendor_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Chemical.create!(@valid_attributes)
  end
end
