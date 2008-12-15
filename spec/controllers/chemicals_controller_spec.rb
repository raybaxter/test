require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ChemicalsController do

  describe "active scaffold" do
     it "should use active scaffold with correctly configured columns for list" do
       config = controller.active_scaffold_config
       config.list.columns.map(&:name).should == [:name, :cas_number, :vendor, :amount, :unit]
     end
   end

end
