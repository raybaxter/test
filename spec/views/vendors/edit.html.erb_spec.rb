require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/vendors/edit.html.erb" do
  include VendorsHelper
  
  before(:each) do
    assigns[:vendor] = @vendor = stub_model(Vendor,
      :new_record? => false
    )
  end

  it "should render edit form" do
    render "/vendors/edit.html.erb"
    
    response.should have_tag("form[action=#{vendor_path(@vendor)}][method=post]") do
    end
  end
end


