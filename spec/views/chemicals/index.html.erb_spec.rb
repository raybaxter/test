require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/chemicals/index.html.erb" do
  include ChemicalsHelper
  
  before(:each) do
    @vendor = Vendor.create!(:name => "VName", :email_address => "hi@mom.com")
    assigns[:chemicals] = [
      stub_model(Chemical,
        :name => "value for name",
        :cas_number => "value for cas_number",
        :amount => "1",
        :unit => "value for unit",
        :vendor => @vendor
      ),
      stub_model(Chemical,
        :name => "value for name",
        :cas_number => "value for cas_number",
        :amount => "1",
        :unit => "value for unit",
        :vendor => @vendor
      )
    ]
  end

  it "should render list of chemicals" do
    render "/chemicals/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", "value for cas_number", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "value for unit", 2)
  end
end

