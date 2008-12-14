class CreateChemicals < ActiveRecord::Migration
  def self.up
    create_table :chemicals do |t|
      t.string :name
      t.string :cas_number
      t.integer :amount
      t.string :unit
      t.integer :vendor_id
      t.timestamps
    end
  end

  def self.down
    drop_table :chemicals
  end
end
