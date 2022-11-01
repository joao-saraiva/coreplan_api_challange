class ProductInformation < ApplicationRecord

  belongs_to :product, required: true
  delegate :ram?, :mother_board?, :graphic_card?, to: :product, allow_nil: true

  validates :ram_slot, :max_ram, :cpu_support, presence: true, if: proc { mother_board? }
  validates :gb_size, presence: true, if: proc { ram? || graphic_card? }

  enum cpu_support: {
    amd: 1,
    intel: 2,
    amd_intel: 3
  }
end
