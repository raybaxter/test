class OneTimeUsesController < ApplicationController
  helper :chemical_uses
  active_scaffold :chemical_use do |config|
    config.label = "One-Time Chemical Usage"
    config.columns = [:chemical, :chemist, :use_date, :amount]
    
    config.create.columns = [:chemical, :chemist, :use_date, :amount]
    config.update.columns = [:chemical, :chemist, :use_date, :amount]
    config.columns[:chemical].form_ui = :select
    list.sorting = {:chemical => 'ASC'}
  end

end
