class CasNumber
  REGISTRY_URL_BASE = "http://chempedia.com/registry_numbers"
  
  def self.validate(number_string)
    new(number_string).valid?
  end
  
  def self.url_for(number_string)
    "#{REGISTRY_URL_BASE}/#{number_string}"
  end
  
  def initialize(number_string)
    @number_string = number_string
  end
  
  def valid?
    # http://www.cas.org/expertise/cascontent/registry/checkdig.html
    valid_format and valid_checksum
  end
  
  def valid_format
    if @number_string.nil? or !@number_string.is_a?(String) or split_digits.size != 3 then
      return false
    end
      
    first,second,check = split_digits
    return false unless (1..7).include?(first.size)
    return false unless second.size == 2
    return false unless check.size == 1
    
    return true
  end
  
  def valid_checksum
    digits = @number_string.gsub(/-/,'').split(//).reverse
    check_digit = digits[0].to_i
    total = 0
    for i in (1...digits.length) do
      total += i*digits[i].to_i
    end
    
    return total.modulo(10) == check_digit
  end
  
  def split_digits
    @number_string.split('-')
  end
end