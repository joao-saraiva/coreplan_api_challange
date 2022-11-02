FactoryBot.define do
  factory :order_product do
    order_id { create(:order).id }
    product_id { create(:product).id }
    quantity { 1 }
  end
end
