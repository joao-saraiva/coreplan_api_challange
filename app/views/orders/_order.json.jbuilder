# frozen_string_literal: true

json.extract! order, :id, :user_id, :order_products, :created_at, :updated_at
json.url order_url(order, format: :json)
