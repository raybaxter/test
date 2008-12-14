class VendorsController < ApplicationController
  active_scaffold :vendor do |config|
     config.label = "Vendors"
     config.columns = [:name, :phone_number, :website_url, :email_address]
     list.sorting = {:name => 'ASC'}
     columns[:phone_number].label = "Phone #"
     columns[:phone_number].description = "(Format: ###-###-####)"
   end
end
