class ChemicalsController < ApplicationController
  active_scaffold :chemical do |config|
    config.label = "Chemical List"
    config.columns = [:name, :cas_number, :vendor, :amount, :unit]
    
    config.create.columns = [:name, :cas_number, :vendor, :amount, :unit]
    config.update.columns = [:name, :cas_number, :vendor, :amount, :unit]
    
    config.columns[:vendor].form_ui = :select
    list.sorting = {:name => 'ASC'}
  end
end