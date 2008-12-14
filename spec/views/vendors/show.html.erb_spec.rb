require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/vendors/show.html.erb" do
  include VendorsHelper
  
  before(:each) do
    assigns[:vendor] = @vendor = stub_model(Vendor)
  end

  it "should render attributes in <p>" do
    render "/vendors/show.html.erb"
  end
end

