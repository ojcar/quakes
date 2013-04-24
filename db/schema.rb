# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130423072942) do

  create_table "quakes", :force => true do |t|
    t.string   "src"
    t.string   "eqid"
    t.integer  "version"
    t.datetime "datetime"
    t.decimal  "lat",        :precision => 7, :scale => 4
    t.decimal  "lon",        :precision => 7, :scale => 4
    t.decimal  "magnitude",  :precision => 3, :scale => 1
    t.decimal  "depth",      :precision => 5, :scale => 2
    t.integer  "nst"
    t.string   "region"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

end
