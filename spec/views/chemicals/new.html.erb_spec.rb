require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/chemicals/new.html.erb" do
  include ChemicalsHelper
  
  before(:each) do
    assigns[:chemical] = stub_model(Chemical,
      :new_record? => true,
      :name => "value for name",
      :cas_number => "value for cas_number",
      :amount => "1",
      :unit => "value for unit"
    )
  end

  it "should render new form" do
    render "/chemicals/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", chemicals_path) do
      with_tag("input#chemical_name[name=?]", "chemical[name]")
      with_tag("input#chemical_cas_number[name=?]", "chemical[cas_number]")
      with_tag("input#chemical_amount[name=?]", "chemical[amount]")
      with_tag("input#chemical_unit[name=?]", "chemical[unit]")
    end
  end
end


