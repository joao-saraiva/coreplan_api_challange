FactoryBot.define do
  factory :order_product do
    product_id { create(:product).id }
    quantity { 1 }

    trait :mother_board do 
      product_id { create(:product, :mother_board).id }
    end

    trait :ram do 
      product_id { create(:product, :ram).id }
    end

    trait :graphic_card do 
      product_id { create(:product, :graphic_card).id }
    end
  end
end
