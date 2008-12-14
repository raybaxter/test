class PhoneNumber
  def self.strip(number)
    if number.nil? then
      return nil
    elsif number.is_a?(Integer)
      return number
    elsif number.is_a?(String) then
      if number.size == 0 then
        return nil
      else
        number.gsub!(/-|\(|\)|\s/,'')
        return nil if number.detect{|c| c.match(/\D/)}
        return number.to_i
      end
    else
      raise "Unknown class for PhoneNumber: #{number} Class: #{number.class}"
    end
  end
end