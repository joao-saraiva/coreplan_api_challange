class Product < ApplicationRecord

  has_one :product_information, dependent: :destroy

  delegate :amd_intel?, :cpu_support, :onboard_graphicis?, :gb_size, :max_ram, :ram_slot, to: :product_information, allow_nil: true

  validates :name, :brand, presence: true

  accepts_nested_attributes_for :product_information

  enum category: {
    cpu: 0,
    mother_board: 1,
    ram: 2,
    graphic_card: 3
  }
end
