require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Periodicity do
  it "should expose constants for 'Weekly', 'Monthly', and 'Business Day'" do
    Periodicity::TYPES.should == ['Weekly', 'Monthly', 'Business Day']
  end
  
  it "should be initialized with a start_date a type" do
    Periodicity.new(Date.today,'Weekly').should_not be_nil
  end

  
  describe "#elapsed_periods"

    describe "Daily" do
      
      describe "if today is a Wednesday day" do
        before(:each) do
          Date.stub!(:today).and_return(Date.new(2008,12,17)) 
        end
        
        it "should return 0 for a start date in the future" do
          Periodicity.new(Date.today + 1,'Business Day').elapsed_periods.should == 0
        end
        
        it "should return 1 for a start date of today" do
          Periodicity.new(Date.today,'Business Day').elapsed_periods.should == 1
        end
        
        it "should return 2 for a start date of yesterday" do
          Periodicity.new(Date.today-1,'Business Day').elapsed_periods.should == 2
        end
        
        it "should return 6 for a start date of 1 week ago" do
          Periodicity.new(Date.today-7,'Business Day').elapsed_periods.should == 6
        end
      end
      
      describe "if today is a Monday and" do
        before(:each) do
          Date.stub!(:today).and_return(Date.new(2008,12,15))
        end

        it "should return 1 for a start date of today" do
          Periodicity.new(Date.today,'Business Day').elapsed_periods.should == 1
        end

        it "should return 1 for a start date of the previous Sunday" do
          Periodicity.new(Date.today-1,'Business Day').elapsed_periods.should == 1
        end

        it "should return 1 for a start date of the previous Saturday" do
          Periodicity.new(Date.today-2,'Business Day').elapsed_periods.should == 1
        end

        it "should return 1 for a start date of the previous Friday" do
          Periodicity.new(Date.today-3,'Business Day').elapsed_periods.should == 2
        end
      end
      
    end
      
    describe "Weekly" do
      describe "if today is a Wednesday" do
        
        before(:each) do
          Date.stub!(:today).and_return(Date.new(2008,12,17)) 
        end
        
        it "should return 0 for a start date in the future" do
          Periodicity.new(Date.today + 1,'Weekly').elapsed_periods.should == 0
        end

        it "should return 1 for a start date of today" do
          Periodicity.new(Date.today,'Weekly').elapsed_periods.should == 1
        end

        it "should return 1 for a start date of yesterday" do
          Periodicity.new(Date.today-1,'Weekly').elapsed_periods.should == 1
        end

        it "should return 1 for last Thursday" do
          Periodicity.new(Date.today-6,'Weekly').elapsed_periods.should == 1
        end

        it "should return 2 for a start date of 1 week ago" do
          Periodicity.new(Date.today-7,'Weekly').elapsed_periods.should == 2
        end

        it "should return 2 for a start date of 13 days ago" do
          Periodicity.new(Date.today-13,'Weekly').elapsed_periods.should == 2
        end
      end
      
      describe "if today is a Monday" do
      
         before(:each) do
      
         it "should return 1 for a start date of today" do
           Periodicity.new(Date.today,'Weekly').elapsed_periods.should == 1
         end
      
         it "should return 1 for a start date of yesterday" do
           Periodicity.new(Date.today-1,'Weekly').elapsed_periods.should == 1
         end
      
         it "should return 1 for last Thursday" do
           Periodicity.new(Date.today-6,'Weekly').elapsed_periods.should == 1
         end
      
         it "should return 2 for last Monday" do
           Periodicity.new(Date.today-7,'Weekly').elapsed_periods.should == 2
         end
      
      end
      
    end

    describe "Monthly" do

      describe "if today is a mid-month day" do

        before(:each) do
          Date.stub!(:today).and_return(Date.new(2008,12,17)) 
        end
        
        it "should return 0 for a start date in the future" do
          Periodicity.new(Date.today + 1,'Monthly').elapsed_periods.should == 0
        end
         
        it "should return 1 for a start date of today" do
          Periodicity.new(Date.today,'Monthly').elapsed_periods.should == 1
        end
         
        it "should return 1 for a start date of yesterday" do
          Periodicity.new(Date.today-1,'Monthly').elapsed_periods.should == 1
        end
        
        it "should return 1 for a start date of less than one month ago" do
          Periodicity.new(Date.today-29,'Monthly').elapsed_periods.should == 1
        end
        
        it "should return 2 for a start date of one month ago" do
          Periodicity.new(Date.today-30,'Monthly').elapsed_periods.should == 2
        end
         
        it "should return 2 for a start date of one month and a day ago" do
          Periodicity.new(Date.today-31,'Monthly').elapsed_periods.should == 2
        end
        
        it "should return 12 for a start date of less than a full year ago" do
          Periodicity.new(Date.new(2007,12,18),'Monthly').elapsed_periods.should == 12
        end
        
        it "should return 13 for a start date of 1 year ago" do
          Periodicity.new(Date.new(2007,12,17),'Monthly').elapsed_periods.should == 13
        end
         
        it "should return 13 for a start date of 1 year and one day ago" do
          Periodicity.new(Date.new(2007,12,16),'Monthly').elapsed_periods.should == 13
        end           
      end    

      describe "if today is a mid-month day" do

        before(:each) do
          Date.stub!(:today).and_return(Date.new(2008,3,31)) 
        end
        
        it "should return 1 for a start date of today" do
          Periodicity.new(Date.today,'Monthly').elapsed_periods.should == 1
        end
         
        it "should return 1 for a start date of less than one month ago" do
          Periodicity.new(Date.today-30,'Monthly').elapsed_periods.should == 1
        end
        
        it "should return 2 for a start date of one month ago" do
          Periodicity.new(Date.today-31,'Monthly').elapsed_periods.should == 2
        end
         
        it "should return 2 for a start date of one month and a day ago" do
          Periodicity.new(Date.today-32,'Monthly').elapsed_periods.should == 2
        end
        
        it "should return 12 for a start date of less than a full year ago" do
          Periodicity.new(Date.new(2007,4,1),'Monthly').elapsed_periods.should == 12
        end
        
        it "should return 13 for a start date of 1 year ago" do
          Periodicity.new(Date.new(2007,3,31),'Monthly').elapsed_periods.should == 13
        end
         
      end    
      
      describe "if today is a leap day" do

        before(:each) do
          Date.stub!(:today).and_return(Date.new(2008,2,29)) 
        end
        
        it "should return 1 for a start date of less than one month ago" do
          Periodicity.new(Date.today-30,'Monthly').elapsed_periods.should == 1
        end
        
        it "should return 2 for a start date of one month ago" do
          Periodicity.new(Date.today-31,'Monthly').elapsed_periods.should == 2
        end
         
        it "should return 2 for a start date of one month and a day ago" do
          Periodicity.new(Date.today-32,'Monthly').elapsed_periods.should == 2
        end
        
        it "should return 12 for a start date of less than a full year ago" do
          Periodicity.new(Date.new(2007,3,1),'Monthly').elapsed_periods.should == 12
        end
        
        it "should return 13 for a start date of 1 year ago" do
          Periodicity.new(Date.new(2007,2,28),'Monthly').elapsed_periods.should == 13
        end
         
      end    
      
    end

  end
  
end