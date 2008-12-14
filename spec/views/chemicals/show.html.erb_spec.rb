require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/chemicals/show.html.erb" do
  include ChemicalsHelper
  
  before(:each) do
    assigns[:chemical] = @chemical = stub_model(Chemical,
      :name => "value for name",
      :cas_number => "value for cas_number",
      :amount => "1",
      :unit => "value for unit"
    )
  end

  it "should render attributes in <p>" do
    render "/chemicals/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ cas_number/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ unit/)
  end
end

