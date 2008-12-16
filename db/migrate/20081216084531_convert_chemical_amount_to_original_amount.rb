class ConvertChemicalAmountToOriginalAmount < ActiveRecord::Migration
  def self.up
    rename_column :chemicals, :amount, :original_amount
  end

  def self.down
    rename_column :chemicals, :original_amount, :amount
  end
end
