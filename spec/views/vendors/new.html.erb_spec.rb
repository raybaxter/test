require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/vendors/new.html.erb" do
  include VendorsHelper
  
  before(:each) do
    assigns[:vendor] = stub_model(Vendor,
      :new_record? => true
    )
  end

  it "should render new form" do
    render "/vendors/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", vendors_path) do
    end
  end
end


