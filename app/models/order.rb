class Order < ApplicationRecord

  belongs_to :user, required: true

  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  accepts_nested_attributes_for :order_products, reject_if: :all_blank?

  validate :should_have_cpu, :should_have_mother_board, :should_have_ram
  validate :should_have_graphic_cards, unless: proc { mother_board_has_graphic_cards? }
  validate :should_have_only_one_graphic_card

  validate :should_respect_max_ram, if: proc { mother_board.present? && rams.any? }
  validate :should_respect_slot_memory_limit, if: proc { mother_board.present? }
  validate :should_respect_cpu_support, if: proc { mother_board.present? && cpu.present? }

  enum status: {
    created: 1,
    confirmed: 2,
    sent: 3,
    delivered: 4 
  }

  def cpu
    @cpu ||= order_products.cpu.last
  end

  def mother_board
    @mother_board ||= order_products.mother_board.last
  end

  def rams
    @rams ||= order_products.rams
  end

  def graphic_card
    @graphic_card ||= order_products.graphic_card.last
  end

  def compatible_cpu?
    return true if mother_board.amd_intel?

    mother_board.cpu_support == cpu.cpu_support
  end

  def mother_board_has_graphic_cards?
    mother_board.onboard_graphicis? rescue true
  end

  private 

  def should_have_cpu
    byebug
    errors.add(:cpu, 'is required to complete your Order') if cpu.nil?
  end

  def should_have_mother_board
    errors.add(:mother_board, 'is required to complete your Order') if mother_board.nil?
  end

  def should_have_ram
    errors.add(:ram, 'is required to complete your Order') if rams.empty? 
  end

  def should_have_graphic_cards
    errors.add(:graphic_card, 'is required to complete your Order') if graphic_card.nil? 
  end

  def should_respect_max_ram
    errors.add(:ram, "Your mother board can only have #{mother_board.max_ram} GB size") if rams.sum(&:gb_size) > mother_board.max_ram
  end

  def should_respect_slot_memory_limit
    errors.add(:ram, "Your mother board can only have #{mother_board.ram_slot} slots") if rams.size > mother_board.ram_slot
  end

  def should_respect_cpu_support
    errors.add(:mother_board, "Your mother board does not support #{cpu.cpu_support}") unless compatible_cpu?
  end

  def should_have_only_one_graphic_card
    errors.add(:graphic_card, "Your mother board does not support #{cpu.cpu_support}") if order_products.graphic_card.empty?
  end
end
