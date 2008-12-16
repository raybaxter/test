class ScheduledUsesController < ApplicationController
  helper :chemical_uses
  active_scaffold :scheduled_use do |config|
    config.label = "Scheduled Chemical Usage"
    config.columns = [:chemical, :chemist, :start_date, :amount, :periodicity_value, :periodicity_type]
    list.sorting = {:chemical => 'ASC'}

    config.create.columns = [:chemical, :chemist, :start_date, :amount, :periodicity_value, :periodicity_type]
    config.update.columns = [:chemical, :chemist, :start_date, :amount, :periodicity_value, :periodicity_type]
    config.columns[:chemical].form_ui = :select
    list.sorting = {:chemical => 'ASC'}


  end
end
