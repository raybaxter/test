require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ChemicalsController do
  def config
    config = controller.active_scaffold_config
  end

  describe "active scaffold" do
     it "should show name, cas_number, vendor, amount and unit columns for list" do
       config.list.columns.map(&:name).should == [:name, :cas_number, :vendor, :original_amount, :unit, :current_amount, :last_full_use_date]
     end
     
     it "should label the last_full_use_date as Last Use Date" do
       config.columns[:last_full_use_date].label.should == "Last Use Date"
     end
     
     
     it "should show name, cas_number, vendor, amount and unit colums for create" do
       config.create.columns.map(&:name).should == [:name, :cas_number, :vendor, :original_amount, :unit]
     end

     it "should show name, cas_number, vendor, amount and unit colums for update" do
       config.update.columns.map(&:name).should == [:name, :cas_number, :vendor, :original_amount, :unit]
     end
   end
   
   describe "creating a chemical" do
     it "should display a drop down for existing vendors" do
       config.columns[:vendor].form_ui.should == :select
     end
   end
   
   describe "updating a chemical" do
     it "should display a drop down of existing vendors" do
       config.columns[:vendor].form_ui.should == :select
     end
   end

end
