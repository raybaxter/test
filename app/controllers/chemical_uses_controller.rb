class ChemicalUsesController < ApplicationController
  active_scaffold :chemical_use do |config|
    config.label = "Chemical Usage"
    config.columns = [:chemical, :chemist, :type, :amount]
    list.sorting = {:chemical => 'ASC'}
  end
end