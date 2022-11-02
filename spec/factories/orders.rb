FactoryBot.define do
  factory :order do
    user_id { create(:user).id }

    trait :complete do 
      order_products { [
        association(:order_product),
        association(:order_product, :mother_board), 
        association(:order_product, :ram), 
        association(:order_product, :graphic_card)
        ] 
      }
    end
  end
end
