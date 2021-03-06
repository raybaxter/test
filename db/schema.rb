# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20081216084531) do

  create_table "chemical_uses", :force => true do |t|
    t.string   "type"
    t.string   "chemist"
    t.integer  "amount"
    t.integer  "chemical_id"
    t.date     "use_date"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "periodicity_type"
    t.integer  "periodicity_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chemicals", :force => true do |t|
    t.string   "name"
    t.string   "cas_number"
    t.integer  "original_amount"
    t.string   "unit"
    t.integer  "vendor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendors", :force => true do |t|
    t.string   "name"
    t.string   "phone_number"
    t.string   "email_address"
    t.string   "website_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
