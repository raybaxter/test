require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe VendorsController do
  
  describe "active scaffold" do
    it "should use active scaffold with correctly configured columns for list" do
      config = controller.active_scaffold_config
      config.list.columns.map(&:name).should == [:name, :phone_number, :website_url, :email_address]
    end
  end


end
