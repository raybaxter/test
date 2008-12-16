class CreateChemicalUses < ActiveRecord::Migration
  def self.up
    create_table :chemical_uses do |t|
      t.string :type
      t.string :chemist
      t.integer :amount
      t.integer :chemical_id
      t.date :use_date
      t.date :start_date
      t.date :end_date
      t.string :periodicity_type
      t.integer :periodicity_value

      t.timestamps
    end
  end

  def self.down
    drop_table :chemical_uses
  end
end
