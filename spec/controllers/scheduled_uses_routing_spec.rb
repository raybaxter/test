require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ScheduledUsesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "scheduled_uses", :action => "index").should == "/scheduled_uses"
    end
  
    it "should map #new" do
      route_for(:controller => "scheduled_uses", :action => "new").should == "/scheduled_uses/new"
    end
  
    it "should map #show" do
      route_for(:controller => "scheduled_uses", :action => "show", :id => 1).should == "/scheduled_uses/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "scheduled_uses", :action => "edit", :id => 1).should == "/scheduled_uses/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "scheduled_uses", :action => "update", :id => 1).should == "/scheduled_uses/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "scheduled_uses", :action => "destroy", :id => 1).should == "/scheduled_uses/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/scheduled_uses").should == {:controller => "scheduled_uses", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/scheduled_uses/new").should == {:controller => "scheduled_uses", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/scheduled_uses").should == {:controller => "scheduled_uses", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/scheduled_uses/1").should == {:controller => "scheduled_uses", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/scheduled_uses/1/edit").should == {:controller => "scheduled_uses", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/scheduled_uses/1").should == {:controller => "scheduled_uses", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/scheduled_uses/1").should == {:controller => "scheduled_uses", :action => "destroy", :id => "1"}
    end
  end
end
