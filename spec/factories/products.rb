FactoryBot.define do
  factory :product do
    name {'Intel I9'}
    brand {'Intel'}
    category {'cpu'}

    trait :mother_board do 
      name {'Asus ROG'}
      brand {'ASUS'}
      category {'mother_board'}
    end

    trait :ram do 
      name {'Kingston Hiper X'}
      brand {'Kingston'}
      category {'ram'}
    end

    trait :graphic_card do 
      name {'Evga Geforce RTX 2060 6GB'}
      brand {'EVGA'}
      category {'graphic_card'}
    end
  end
end
