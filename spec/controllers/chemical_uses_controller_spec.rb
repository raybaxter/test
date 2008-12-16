require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ChemicalUsesController do
  describe "active scaffold" do
    it "should have correctly configured columns for list" do
      config = controller.active_scaffold_config
      config.list.columns.map(&:name).should == [:chemical, :chemist, :type, :amount]
    end
    
    it "should not have create or update forms" do
      config = controller.active_scaffold_config
      config.actions.should_not include(:create )
      config.actions.should_not include(:update )
    end
        
  end
  
end
