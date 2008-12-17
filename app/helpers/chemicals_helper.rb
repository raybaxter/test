module ChemicalsHelper
  def all_vendors
    Vendor.find(:all)
  end
  
  def last_full_use_date_column(record)
    record.last_usable_date || ""
  end
  
  
  def link_for_cas_number(number)
    return "" if number.nil? or number.blank?
    "<a href=\"#{CasNumber.url_for(number)}\">#{number}</a>"
  end
end
