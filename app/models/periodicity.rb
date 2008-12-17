class Periodicity
  require 'date'
  WEEKLY = 'Weekly'
  MONTHLY = 'Monthly'
  BUSINESS_DAILY = 'Business Day'
  
  TYPES = [WEEKLY, MONTHLY, BUSINESS_DAILY]
  
  def initialize(type, start_date, end_date=nil, interval=1)
    raise "Unknown type: #{type}" unless TYPES.include?(type)
    
    @type = type
    @start_date = start_date
    @end_date = end_date || Date.today
    @interval = interval

  end
  
  def elapsed_periods
    case @type
      when BUSINESS_DAILY : elapsed_days
      when WEEKLY       : elapsed_weeks
      when MONTHLY      : elapsed_months
      else raise "Unknown type: #{@type}"
    end
  end
  
  def date_after_n_periods(n)
    case @type
      when BUSINESS_DAILY : date_after_n_days(n)
      when WEEKLY         : date_after_n_weeks(n)
      when MONTHLY        : date_after_n_months(n)
      else raise "Unknown type: #{@type}"
    end
  end

  private
  
  def date_after_n_days(n)
    return nil if @end_date < Date.today
    i = 0
    date = Date.today
    while i < n
      date += 1
      i += date.cwday < 6 ? 1 : 0
    end
    date
  end
  
  def date_after_n_weeks(n)
    return nil if @end_date < Date.today
    today = Date.today
    return nil if n == 0 and @start_date < today
    return today if n == 0
    
    today_cwday = today.cwday
    start_cwday = @start_date.cwday
    
    correction  = if start_cwday <= today_cwday
        today_cwday - start_cwday
      else 
        today_cwday + 7 - start_cwday
      end 
    working_day = today - correction
    total_days = n * 7
    working_day + total_days 
  end
  
  def date_after_n_months(n)
    return nil if @end_date < Date.today
    today = Date.today
    return nil if n == 0 and @start_date < today
    return today if n == 0
    
    today_mday = today.mday
    mday = @start_date.mday
    
    n -= 1 if today_mday < mday and @start_date.month < today.month
          
    time = Date.new(today.year,today.month,mday).plus_with_duration(n.months)
    Date.new(time.year,time.month,time.day)
  end
  
  def elapsed_days
    sum = 0
    counter = 0
    @end_date.downto(@start_date)  do |d| 
      if d.cwday < 6
        sum += counter.modulo(@interval) == 0 ? 1 : 0
        counter += 1
      end
    end
    sum    
  end
  
  def elapsed_weeks
    return 0 if @start_date > @end_date
    ((@end_date-@start_date)/7).to_i + 1
  end
  
  def elapsed_months
    sum = 0
    original_day = @end_date.mday

    date = Date.new(@end_date.year,@end_date.month,@end_date.day)
    
    while(date >= @start_date)
      sum += 1
      year = date.year
      month = date.month
      day = original_day
      
      if month == 1
        year -= 1 
        month = 12 
      else
        month -= 1
      end
      
      if (month == 2 and day > 28)
        day = date.leap? ? 29 : 28 
      elsif ([4,6,9,11].include?(month) and day > 30)
        day = 30
      end

      date = Date.new(year,month,day)
    end
    sum
  end
   
end

class BusinessDay < Periodicity
  
  def initialize(start_date,end_date=Date.today,interval=1)
    super(BUSINESS_DAILY,start_date,end_date,interval)
  end
  
  def elapsed_periods
    elapsed_days
  end
end

class Weekly < Periodicity
  
  def initialize(start_date,end_date=Date.today,interval=1)
    super(WEEKLY,start_date,end_date,interval)
  end
  
  def elapsed_periods
    elapsed_weeks
  end
  
end

class Monthly < Periodicity
  
  def initialize(start_date,end_date=Date.today,interval=1)
    super(MONTHLY,start_date,end_date,interval)
  end
  
  def elapsed_periods
    elapsed_months
  end

end