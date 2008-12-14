require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/vendors/index.html.erb" do
  include VendorsHelper
  
  before(:each) do
    assigns[:vendors] = [
      stub_model(Vendor),
      stub_model(Vendor)
    ]
  end

  it "should render list of vendors" do
    render "/vendors/index.html.erb"
  end
end

