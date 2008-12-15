module ChemicalsHelper
  def all_vendors
    Vendor.find(:all)
  end
  
  def link_for_cas_number(number)
    return "" if number.nil? or number.blank?
    "<a href=\"#{CasNumber.url_for(number)}\">#{number}</a>"
  end
end
