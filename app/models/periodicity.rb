class Periodicity
  require 'date'
  TYPES = ['Weekly', 'Monthly', 'Business Day']
  
  def initialize(start_date, type)
    @start_date = start_date
    @type = type
  end
  
  def elapsed_periods
    case @type
      when 'Business Day' : elapsed_days
      when 'Weekly' : elapsed_weeks
      when 'Monthly' : elapsed_months
      else raise "Unknown type: #{@type}"
    end 
  end
  
  def elapsed_days
    sum = 0
    Date.today.downto(@start_date) { |d| sum += (d.cwday < 6 ? 1 : 0)}
    sum
  end

  def elapsed_weeks
    today = Date.today
    return 0 if @start_date > today
    ((today-@start_date)/7).to_i + 1
  end
  
  def elapsed_months
    sum = 0
    today = Date.today
    date = Date.new(today.year,today.month,today.day)
    original_day = today.mday
    
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