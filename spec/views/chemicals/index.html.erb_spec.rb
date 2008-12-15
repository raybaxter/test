require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/chemicals/index.html.erb" do
  include ChemicalsHelper
  
  before(:each) do
    @vendor = Vendor.create!(:name => "VName", :email_address => "hi@mom.com")
    assigns[:chemicals] = [
      stub_model(Chemical,
        :id => "1"*9,
        :name => "value for name",
        :cas_number => "1234567-89-5",
        :amount => "1",
        :unit => "value for unit",
        :vendor => @vendor
      ),
      stub_model(Chemical,
        :id => "2"*9,
        :name => "value for name",
        :cas_number => "67-68-5",
        :amount => "1",
        :unit => "value for unit",
        :vendor => @vendor
      )
    ]
  end

  it "should render list of chemicals" do
    render "/chemicals/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td>a", "1234567-89-5")
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "value for unit", 2)
  end
  
  it "should have a unique table row id for each chemical" do
    render "/chemicals/index.html.erb"
    response.should have_tag('tr#row-id-111111111')
    response.should have_tag('tr#row-id-222222222')
  end
   
  it "should include prototype.js" do
    render "/chemicals/index.html.erb", :layout => "application"
    response.should include_text('prototype.js')
  end
  
  
end

