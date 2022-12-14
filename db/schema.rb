# frozen_string_literal: true

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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_221_101_014_911) do
  create_table 'order_products', force: :cascade do |t|
    t.integer 'order_id'
    t.integer 'product_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'orders', force: :cascade do |t|
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'product_informations', force: :cascade do |t|
    t.integer 'ram_slot'
    t.integer 'max_ram'
    t.boolean 'onboard_graphics'
    t.integer 'cpu_support'
    t.integer 'product_id'
    t.integer 'gb_size'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'products', force: :cascade do |t|
    t.string 'name'
    t.string 'brand'
    t.integer 'category'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email'
    t.string 'password'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
