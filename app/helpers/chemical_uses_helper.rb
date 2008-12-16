module ChemicalUsesHelper
  
  def chemical_ids_form_column(record, input_name)
    select_tag 'record[chemical][]',
      options_for_select(Chemicals.all.collect{|u| [u.name, u.id]}, record.chemicals.collect{|u| u.id}),
                 :id => 'record_chemical'
  end
      
end
