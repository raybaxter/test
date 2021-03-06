require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe VendorsController do
  describe "route generation" do
    it "should map #update_table" do
      route_for(:controller => "vendors", :action => "update_table").should == "/vendors/update_table"
    end
    
    it "should map #index" do
      route_for(:controller => "vendors", :action => "index").should == "/vendors"
    end
  
    it "should map #new" do
      route_for(:controller => "vendors", :action => "new").should == "/vendors/new"
    end
  
    it "should map #show" do
      route_for(:controller => "vendors", :action => "show", :id => 1).should == "/vendors/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "vendors", :action => "edit", :id => 1).should == "/vendors/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "vendors", :action => "update", :id => 1).should == "/vendors/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "vendors", :action => "destroy", :id => 1).should == "/vendors/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #update_table" do
      params_from(:get, "/vendors/update_table").should == {:controller => "vendors", :action => "update_table"}
    end

    it "should generate params for #index" do
      params_from(:get, "/vendors").should == {:controller => "vendors", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/vendors/new").should == {:controller => "vendors", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/vendors").should == {:controller => "vendors", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/vendors/1").should == {:controller => "vendors", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/vendors/1/edit").should == {:controller => "vendors", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/vendors/1").should == {:controller => "vendors", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/vendors/1").should == {:controller => "vendors", :action => "destroy", :id => "1"}
    end

    it "should generate params for #update_table" do
      params_from(:get, "/vendors/update_table").should == {:controller => "vendors", :action => "update_table"}
    end
  end
end
