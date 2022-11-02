class OrderProduct < ApplicationRecord
  belongs_to :order, required: true
  belongs_to :product, required: true

  delegate :cpu?, :mother_board?, :product_information, :ram?, :graphic_card?, :cpu_support, :amd_intel?, :onboard_graphics?, :gb_size, :max_ram, :ram_slot, to: :product, allow_nil: true

  validates :quantity, numericality: { greater_than: 0, less_than_or_equal_to: 99 }
  validates :quantity, numericality: { equal_to: 1 }, if: proc { cpu? || mother_board? }
end
