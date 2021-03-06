require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OneTimeUsesController do
  describe "active scaffold" do
    it "should use the OneTimeUse model" do
      config = controller.active_scaffold_config
      require 'debug'; debugger
      config.columns.active_record_class.should == OneTimeUse # One way
      config.model.should == OneTimeUse # Another way
    end
    
    it "should use active scaffold with correctly configured columns for list" do
      controller.active_scaffold_config.should_not be_nil 
      config = controller.active_scaffold_config
      config.list.columns.map(&:name).should == [:chemical, :chemist, :use_date, :amount]
    end
    
  end
end