require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ChemicalsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "chemicals", :action => "index").should == "/chemicals"
    end
  
    it "should map #new" do
      route_for(:controller => "chemicals", :action => "new").should == "/chemicals/new"
    end
  
    it "should map #show" do
      route_for(:controller => "chemicals", :action => "show", :id => 1).should == "/chemicals/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "chemicals", :action => "edit", :id => 1).should == "/chemicals/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "chemicals", :action => "update", :id => 1).should == "/chemicals/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "chemicals", :action => "destroy", :id => 1).should == "/chemicals/1"
    end
  end

  describe "route recognition" do
    
    it "should generate params for /" do
      params_from(:get, "/").should == {:controller => "chemicals", :action => "index"}
    end
    
    
    it "should generate params for #index" do
      params_from(:get, "/chemicals").should == {:controller => "chemicals", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/chemicals/new").should == {:controller => "chemicals", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/chemicals").should == {:controller => "chemicals", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/chemicals/1").should == {:controller => "chemicals", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/chemicals/1/edit").should == {:controller => "chemicals", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/chemicals/1").should == {:controller => "chemicals", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/chemicals/1").should == {:controller => "chemicals", :action => "destroy", :id => "1"}
    end

    it "should generate params for #update_table" do
      params_from(:get, "/chemicals/update_table").should == {:controller => "chemicals", :action => "update_table"}
    end
  end
end
