class ChemicalsController < ApplicationController
  active_scaffold :chemical do |config|
    config.label = "Chemical List"
    config.columns = [:name, :cas_number, :vendor, :amount, :unit]
    list.sorting = {:name => 'ASC'}
  end
end