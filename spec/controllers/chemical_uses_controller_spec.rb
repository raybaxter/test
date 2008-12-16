require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ChemicalUsesController do
  describe "active scaffold" do
    it "should have correctly configured columns for list" do
      config = controller.active_scaffold_config
      config.list.columns.map(&:name).should == [:chemical, :chemist, :type, :amount]
    end
    
    it "should have correct columns for create" do
      config = controller.active_scaffold_config
      config.update.columns = [:chemical_id, :chemist, :use_date, :amount]
    end
    
    it "should have correct columns for update" do
      config = controller.active_scaffold_config
      config.create.columns = [:chemical_id, :chemist, :use_date, :amount]
    end
    
  end
  
end
