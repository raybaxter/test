require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Periodicity do
  
  it "should expose constants for 'Weekly', 'Monthly', and 'Business Day'" do
    Periodicity::TYPES.should == ['Weekly', 'Monthly', 'Business Day']
  end
  
  it "should be inialized with a type, a start date, an optional end_date and an optional interval" do
    Periodicity.new('Weekly', Date.today).should_not be_nil
    Periodicity.new('Weekly', Date.today, Date.today - 5).should_not be_nil
    Periodicity.new('Weekly', Date.today, Date.today - 5, 3).should_not be_nil
  end
  
  describe "subclasses" do
    
    it "should have BusinessDay, Weekly, and Monthly Subclasses" do
      BusinessDay.superclass.should == Periodicity
      Weekly.superclass.should == Periodicity
      Monthly.superclass.should == Periodicity
    end
    
  end
  
  describe "#elapsed_periods ending today" do

    describe "BusinessDay" do
      
      describe "if today is a Wednesday" do
        
        before(:each) do
          Date.stub!(:today).and_return(Date.new(2008,12,17)) 
        end
        
        it "should return 0 for a start date in the future" do
          BusinessDay.new(Date.today + 1).elapsed_periods.should == 0
        end
        
        it "should return 1 for a start date of today" do
          BusinessDay.new(Date.today).elapsed_periods.should == 1
        end
        
        it "should return 2 for a start date of yesterday" do
          BusinessDay.new(Date.today-1).elapsed_periods.should == 2
        end
        
        it "should return 6 for a start date of 1 week ago" do
          BusinessDay.new(Date.today-7).elapsed_periods.should == 6
        end
        
      end
      
      describe "if today is a Monday" do
        
        before(:each) do
          Date.stub!(:today).and_return(Date.new(2008,12,15))
        end

        it "should return 1 for a start date of today" do
          BusinessDay.new(Date.today).elapsed_periods.should == 1
        end

        it "should return 1 for a start date of the previous Sunday" do
          BusinessDay.new(Date.today-1).elapsed_periods.should == 1
        end

        it "should return 1 for a start date of the previous Saturday" do
          BusinessDay.new(Date.today-2).elapsed_periods.should == 1
        end

        it "should return 1 for a start date of the previous Friday" do
          BusinessDay.new(Date.today-3).elapsed_periods.should == 2
        end
        
      end
      
    end
      
    describe "Every N business days" do
      
      describe "with an interval of 3 if today is a Wednesday" do
        
        before(:each) do
           Date.stub!(:today).and_return(Date.new(2008,12,17)) 
         end
      
        it "should return 1 for a start date of today" do
           BusinessDay.new(Date.today,nil,3).elapsed_periods.should == 1
         end
      
        it "should return 1 for a start date of yesterday" do
          BusinessDay.new(Date.today-1,nil,3).elapsed_periods.should == 1
        end
      
        it "should return 1 for last Saturday" do
          BusinessDay.new(Date.today-4,nil,3).elapsed_periods.should == 1
        end
        
        it "should return 2 for last Friday" do
          BusinessDay.new(Date.today-5,nil,3).elapsed_periods.should == 2
        end
        
      end
      
      describe "with an interval of 3 if today is a Monday" do
        
        before(:each) do
          Date.stub!(:today).and_return(Date.new(2008,12,15))
        end
      
        it "should return 1 for a start date of today" do
          BusinessDay.new(Date.today,nil,3).elapsed_periods.should == 1
        end
      
        it "should return 1 for a start date of the previous Thursday" do
          BusinessDay.new(Date.today-4,nil,3).elapsed_periods.should == 1
        end
      
        it "should return 2 for a start date of the previous Wednesay" do
          BusinessDay.new(Date.today-5,nil,3).elapsed_periods.should == 2
        end
      
        it "should return 2 for a start date of the previous Monday" do
          BusinessDay.new(Date.today-7,nil,3).elapsed_periods.should == 2
        end
        
      end
    
    end
       
    describe "Weekly" do

      describe "if today is a Wednesday" do
        
        before(:each) do
          Date.stub!(:today).and_return(Date.new(2008,12,17)) 
        end
        
        it "should return 0 for a start date in the future" do
          Weekly.new(Date.today + 1).elapsed_periods.should == 0
        end

        it "should return 1 for a start date of today" do
          Weekly.new(Date.today).elapsed_periods.should == 1
        end

        it "should return 1 for a start date of yesterday" do
          Weekly.new(Date.today-1).elapsed_periods.should == 1
        end

        it "should return 1 for last Thursday" do
          Weekly.new(Date.today-6).elapsed_periods.should == 1
        end

        it "should return 2 for a start date of 1 week ago" do
          Weekly.new(Date.today-7).elapsed_periods.should == 2
        end

        it "should return 2 for a start date of 13 days ago" do
          Weekly.new(Date.today-13).elapsed_periods.should == 2
        end
        
      end
      
      describe "if today is a Monday" do
      
         before(:each) do
           Date.stub!(:today).and_return(Date.new(2008,12,15))
         end
      
         it "should return 1 for a start date of today" do
           Weekly.new(Date.today).elapsed_periods.should == 1
         end
      
         it "should return 1 for a start date of yesterday" do
           Weekly.new(Date.today-1).elapsed_periods.should == 1
         end
      
         it "should return 1 for last Thursday" do
           Weekly.new(Date.today-6).elapsed_periods.should == 1
         end
      
         it "should return 2 for last Monday" do
           Weekly.new(Date.today-7).elapsed_periods.should == 2
         end
      
      end
      
    end

    describe "Monthly" do

      describe "if today is a mid-month day" do

        before(:each) do
          Date.stub!(:today).and_return(Date.new(2008,12,17)) 
        end
        
        it "should return 0 for a start date in the future" do
          Monthly.new(Date.today + 1).elapsed_periods.should == 0
        end
         
        it "should return 1 for a start date of today" do
          Monthly.new(Date.today).elapsed_periods.should == 1
        end
         
        it "should return 1 for a start date of yesterday" do
          Monthly.new(Date.today-1).elapsed_periods.should == 1
        end
        
        it "should return 1 for a start date of less than one month ago" do
          Monthly.new(Date.today-29).elapsed_periods.should == 1
        end
        
        it "should return 2 for a start date of one month ago" do
          Monthly.new(Date.today-30).elapsed_periods.should == 2
        end
         
        it "should return 2 for a start date of one month and a day ago" do
          Monthly.new(Date.today-31).elapsed_periods.should == 2
        end
        
        it "should return 12 for a start date of less than a full year ago" do
          Monthly.new(Date.new(2007,12,18)).elapsed_periods.should == 12
        end
        
        it "should return 13 for a start date of 1 year ago" do
          Monthly.new(Date.new(2007,12,17)).elapsed_periods.should == 13
        end
         
        it "should return 13 for a start date of 1 year and one day ago" do
          Monthly.new(Date.new(2007,12,16)).elapsed_periods.should == 13
        end
                   
      end    

      describe "if today is last day of month" do

        before(:each) do
          Date.stub!(:today).and_return(Date.new(2008,3,31)) 
        end
        
        it "should return 1 for a start date of today" do
          Monthly.new(Date.today).elapsed_periods.should == 1
        end
         
        it "should return 1 for a start date of less than one month ago" do
          Monthly.new(Date.today-30).elapsed_periods.should == 1
        end
        
        it "should return 2 for a start date of one month ago" do
          Monthly.new(Date.today-31).elapsed_periods.should == 2
        end
         
        it "should return 2 for a start date of one month and a day ago" do
          Monthly.new(Date.today-32).elapsed_periods.should == 2
        end
        
        it "should return 12 for a start date of less than a full year ago" do
          Monthly.new(Date.new(2007,4,1)).elapsed_periods.should == 12
        end
        
        it "should return 13 for a start date of 1 year ago" do
          Monthly.new(Date.new(2007,3,31)).elapsed_periods.should == 13
        end
         
      end    
      
      describe "if today is a leap day" do

        before(:each) do
          Date.stub!(:today).and_return(Date.new(2008,2,29)) 
        end
        
        it "should return 1 for a start date of less than one month ago" do
          Monthly.new(Date.today-30).elapsed_periods.should == 1
        end
        
        it "should return 2 for a start date of one month ago" do
          Monthly.new(Date.today-31).elapsed_periods.should == 2
        end
         
        it "should return 2 for a start date of one month and a day ago" do
          Monthly.new(Date.today-32).elapsed_periods.should == 2
        end
        
        it "should return 12 for a start date of less than a full year ago" do
          Monthly.new(Date.new(2007,3,1)).elapsed_periods.should == 12
        end
        
        it "should return 13 for a start date of 1 year ago" do
          Monthly.new(Date.new(2007,2,28)).elapsed_periods.should == 13
        end
         
      end    
      
    end

  end

  describe "#elapsed_periods consider end_dates" do
    
    before(:each) do
      Date.stub!(:today).and_return(Date.new(2008,12,17)) 
    end
    
    describe BusinessDay do
      it "should stop counting at end date" do
        BusinessDay.new(Date.today-7,Date.today-6).elapsed_periods.should == 2
      end
    end

    describe Weekly do
      it "should stop counting at end date" do
        Weekly.new(Date.today-7,Date.today-1).elapsed_periods.should == 1
        Weekly.new(Date.today-17,Date.today-7).elapsed_periods.should == 2
      end
    end

    describe Monthly do
      it "should description" do
        Monthly.new(Date.today-100,Date.today-60).elapsed_periods.should == 2
      end      
    end  
    
  end
  
  describe "#date_after_n_periods" do

    describe "BusinessDay, Simple Wednesday" do
      
      before(:each) do
        Date.stub!(:today).and_return(Date.new(2008,12,17)) 
      end

      it "should return today's date after 0 periods" do
        BusinessDay.new(Date.today-7).date_after_n_periods(0).should == Date.today
      end

      it "should return tomorrows's date after 1 periods" do
        BusinessDay.new(Date.today-7).date_after_n_periods(1).should == Date.today + 1
      end

      it "should return next Mondays's date for 3 periods" do
        BusinessDay.new(Date.today-7).date_after_n_periods(3).should == Date.new(2008,12,22)
      end
      
      it "should return nil if end date is before today" do
        BusinessDay.new(Date.today-7,Date.today-3).date_after_n_periods(3).should be_nil
      end

    end
    
    describe "Weekly" do
      
      before(:each) do
        Date.stub!(:today).and_return(Date.new(2008,12,17)) 
      end

      it "should today's date after 0 periods if start date is today" do
        Weekly.new(Date.today).date_after_n_periods(0).should == Date.today
      end
      
      it "should return nil after 0 periods if start date is before today" do
        Weekly.new(Date.today-1).date_after_n_periods(0).should be_nil
      end
      
      it "should return next Tuesday after 1 period if start date is yesterday" do
        Weekly.new(Date.today-1).date_after_n_periods(1).should == Date.today+6
      end
      
      it "should return next Friday after 1 period if start date is last Friday" do
        Weekly.new(Date.today-5).date_after_n_periods(1).should == Date.today+2
      end
      
      it "should return next Friday after 1 period if start date is next Friday" do
        Weekly.new(Date.today+2).date_after_n_periods(1).should == Date.today+2
      end
      
      it "should should return Wednesay of this week next year after 52 periods" do
        Weekly.new(Date.today).date_after_n_periods(52).should == Date.new(2009,12,16)
      end
      
      it "should return nil if end date if before today" do
        Weekly.new(Date.today-19,Date.today-5).date_after_n_periods(1).should be_nil
      end
      
    end
    
    
    describe "Monthly" do
      
      describe "middle of month" do
        
        before(:each) do
          Date.stub!(:today).and_return(Date.new(2008,12,17)) 
        end
        
        it "should return today's date after 0 periods if start date is today" do
          Monthly.new(Date.today).date_after_n_periods(0).should == Date.today
        end
        
        it "should return nil after 0 periods if start date is before today" do
          Monthly.new(Date.today-1).date_after_n_periods(0).should be_nil
        end
        
        it "should return tommorrow after 1 period if start date one month ago tomorrow" do
          Monthly.new(Date.new(2008,11,18)).date_after_n_periods(1).should == Date.new(2008,12,18)
        end
        
        it "should return one month from yesterday after 1 period if start date is yesterday" do
          Monthly.new(Date.new(2008,12,16)).date_after_n_periods(1).should == Date.new(2009,1,16)
        end

        it "should return nil if end date is before today" do
          Monthly.new(Date.today-100,Date.today-50).date_after_n_periods(2).should be_nil
        end
        
        
      end
      
      describe "end of month" do

        before(:each) do
          Date.stub!(:today).and_return(Date.new(2009,1,31)) 
        end
        
        it "should return March 30 as 2 months after January 30" do
          Monthly.new(Date.new(2009,1,30)).date_after_n_periods(2).should == Date.new(2009,3,30)
        end

        it "should return February 28 as 1 month1 after January 30" do
          Monthly.new(Date.new(2009,1,30)).date_after_n_periods(1).should == Date.new(2009,2,28)
        end
                      
      end

    end

  end


  
end