FactoryBot.define do
  factory :product do
    trait :cpu do 
      name {'Intel I9'}
      brand {'Intel'}
      category {'cpu'}

      after(:create) do |product|
        create(:product_information, product_id: product.id)
      end
    end

    trait :mother_board do 
      name {'Asus ROG'}
      brand {'ASUS'}
      category {'mother_board'}

      after(:create) do |product|
        create(:product_information, :mother_board, product_id: product.id)
      end
    end

    trait :ram do 
      name {'Kingston Hiper X'}
      brand {'Kingston'}
      category {'ram'}

      after(:create) do |product|
        create(:product_information, :ram, product_id: product.id) 
      end
    end

    trait :graphic_card do 
      name {'Evga Geforce RTX 2060 6GB'}
      brand {'EVGA'}
      category {'graphic_card'}

      after(:create) do |product|
        create(:product_information, :graphic_card, product_id: product.id)
      end
    end
  end
end
