require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/chemicals/edit.html.erb" do
  include ChemicalsHelper
  
  before(:each) do
    assigns[:chemical] = @chemical = stub_model(Chemical,
      :new_record? => false,
      :name => "value for name",
      :cas_number => "value for cas_number",
      :amount => "1",
      :unit => "value for unit"
    )
  end

  it "should render edit form" do
    render "/chemicals/edit.html.erb"
    
    response.should have_tag("form[action=#{chemical_path(@chemical)}][method=post]") do
      with_tag('input#chemical_name[name=?]', "chemical[name]")
      with_tag('input#chemical_cas_number[name=?]', "chemical[cas_number]")
      with_tag('input#chemical_amount[name=?]', "chemical[amount]")
      with_tag('input#chemical_unit[name=?]', "chemical[unit]")
    end
  end
end


