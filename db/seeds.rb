# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cpus_attributes = [
  {name: 'Core i5', brand: 'Intel', category: 'cpu'},
  {name: 'Core i5', brand: 'Intel', category: 'cpu'},
  {name: 'Ryzen 5', brand: 'AMD', category: 'cpu'},
  {name: 'Ryzen 7', brand: 'AMD', category: 'cpu'},
]

cpus_attributes.each do |cpu_attributes|
  Product.create!(cpu_attributes)
end

mother_boards_attributes = [
  { name: 'Asus ROG', brand: 'ASUS', category: 'mother_board',
    product_information_attributes: {
    ram_slot: 2, max_ram: 16, onboard_graphicis: false, cpu_support: 'intel'
    }
  },
  { name: 'Gigabyte Aorus', brand: 'Gigabyte', category: 'mother_board',
    product_information_attributes: {
    ram_slot: 2, max_ram: 16, onboard_graphicis: false, cpu_support: 'amd'
    }
  }, 
  { name: 'ASRock Steel Legend', brand: 'ASRock', category: 'mother_board',
    product_information_attributes: {
    ram_slot: 4, max_ram: 64, onboard_graphicis: true, cpu_support: 'amd_intel'
    }
  }, 
]

mother_boards_attributes.each do |mother_board_attributes|
  Product.create!(mother_board_attributes)
end

rams_attributes = [
  { name: 'Kingston Hiper X', brand: 'Kingston', category: 'ram',
    product_information_attributes: {
      gb_size: 4
      }
  },
  { name: 'Kingston Hiper X', brand: 'Kingston', category: 'ram',
    product_information_attributes: {
      gb_size: 8
      }
  },
  { name: 'Kingston Hiper X', brand: 'Kingston', category: 'ram',
    product_information_attributes: {
      gb_size: 16
      }
  },
  { name: 'Kingston Hiper X', brand: 'Kingston', category: 'ram',
    product_information_attributes: {
      gb_size: 32
      }
  },
  { name: 'Kingston Hiper X', brand: 'Kingston', category: 'ram',
    product_information_attributes: {
      gb_size: 64
      }
  },
]

rams_attributes.each do |ram_attributes|
  Product.create!(ram_attributes)
end

graphic_cards_attributes = [
  { name: 'Evga Geforce RTX 2060 6GB', brand: 'EVGA', category: 'graphic_card',
    product_information_attributes: {
      gb_size: 6
      }
  },
  { name: 'Asus ROG Strix Geforce RTX 3060 6GB', brand: 'ASUS', category: 'graphic_card',
    product_information_attributes: {
      gb_size: 6
      }
  },
  { name: 'Gigabyte Radeon RX 6600 XT EAGLE 8GB', brand: 'Gigabyte', category: 'graphic_card',
    product_information_attributes: {
      gb_size: 8
      }
  },
]

graphic_cards_attributes.each do |graphic_card_attributes|
  Product.create!(graphic_card_attributes)
end