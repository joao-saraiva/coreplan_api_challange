class OrderProduct < ApplicationRecord
  belongs_to :order, required: true
  belongs_to :product, required: true

  delegate :cpu?, :mother_board?, :product_information, :ram?, :graphic_card?, :cpu_support, :amd_intel?, :onboard_graphics?, :gb_size, :max_ram, :ram_slot, to: :product, allow_nil: true
end
