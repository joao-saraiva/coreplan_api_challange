class ProductInformation < ApplicationRecord

  belongs_to :product, required: true
  delegate :ram?, :mother_board?, :graphic_card?, :cpu?, to: :product, allow_nil: true

  validates :ram_slot, :max_ram, presence: true, if: proc { mother_board? }
  validates :cpu_support, presence: true, if: proc { cpu? || mother_board? }
  validates :gb_size, presence: true, if: proc { ram? || graphic_card? }

  enum cpu_support: {
    amd: 0,
    intel: 1,
    amd_intel: 2
  }
end
