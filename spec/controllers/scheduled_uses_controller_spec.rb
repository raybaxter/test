require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ScheduledUsesController do
  describe "active scaffold" do
    it "should use active scaffold with correctly configured columns for list" do
      config = controller.active_scaffold_config
      config.list.columns.map(&:name).should == [:chemical, :chemist, :start_date, :amount, :periodicity_value, :periodicity_type]
    end
  end
end
