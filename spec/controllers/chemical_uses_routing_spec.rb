require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ChemicalUsesController do
  describe "route generation" do
    
    it "should map #index" do
      route_for(:controller => "chemical_uses", :action => "index").should == "/chemical_uses"
    end  
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/chemical_uses").should == {:controller => "chemical_uses", :action => "index"}
    end
    
    it "should generate params for #update_table" do
      params_from(:get, "/chemical_uses/update_table").should == {:controller => "chemical_uses", :action => "update_table"}
    end
  end
end
