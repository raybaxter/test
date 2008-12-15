require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/chemicals/show.html.erb" do
  include ChemicalsHelper
  
  before(:each) do
    vendor = Vendor.create!(:name => "Vendor", :email_address => "e@a.com")
    assigns[:chemical] = @chemical = stub_model(Chemical,
      :name => "value for name",
      :cas_number => "1234567-89-5",
      :amount => "1",
      :unit => "value for unit",
      :vendor => vendor
    )
  end

  it "should render attributes in <p>" do
    render "/chemicals/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/1234567-89-5/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ unit/)
  end
  
  it "should render a link for cas_number" do
    render "/chemicals/show.html.erb"
    response.should have_tag("p>a", "1234567-89-5")
  end
  
end

