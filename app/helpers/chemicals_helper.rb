module ChemicalsHelper
  def all_vendors
    Vendor.find(:all)
  end
end
