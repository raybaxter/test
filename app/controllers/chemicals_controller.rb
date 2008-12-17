class ChemicalsController < ApplicationController
  active_scaffold :chemical do |config|
    config.label = "Chemical List"
    config.columns = [:name, :cas_number, :vendor, :original_amount, :unit, :current_amount, :last_full_use_date]
    
    config.create.columns = [:name, :cas_number, :vendor, :original_amount, :unit]
    config.update.columns = [:name, :cas_number, :vendor, :original_amount, :unit]
    
    config.columns[:vendor].form_ui = :select
    config.columns[:last_full_use_date].label = "Last Use Date"
    
    list.sorting = {:name => 'ASC'}
  end
end