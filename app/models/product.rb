class Product < ApplicationRecord

  has_one :product_information, dependent: :destroy

  delegate :amd_intel?, :cpu_support, :onboard_graphicis?, to: :product_information, allow_nil: true

  validates :name, :brand, presence: true

  accepts_nested_attributes_for :product_information

  enum category: {
    cpu: 1,
    mother_board: 2,
    ram: 3,
    graphic_card: 4
  }
end
