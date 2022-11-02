FactoryBot.define do
  factory :product_information do
    product { create(:product).id }
    cpu_support { "intel" }

    trait :mother_board do 
      product { create(:product, :mother_board).id }
      cpu_support { "intel" }
      ram_slot { 2 }
      max_ram { 16 }
      onboard_graphicis { false }
    end

    trait :ram do 
      product { create(:product, :ram).id }
      gb_size { 16 }
    end

    trait :graphic_card do 
      product { create(:product, :graphic_card).id }
      gb_size { 6 }
    end
  end
end
