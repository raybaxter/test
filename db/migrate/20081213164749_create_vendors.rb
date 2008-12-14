class CreateVendors < ActiveRecord::Migration
  def self.up
    create_table :vendors do |t|
      t.string :name
      t.string :phone_number
      t.string :email_address
      t.string :website_url
      t.timestamps
    end
  end

  def self.down
    drop_table :vendors
  end
end
