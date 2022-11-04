# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user, required: true

  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  accepts_nested_attributes_for :order_products, reject_if: :all_blank, allow_destroy: true

  validate :should_have_cpu, :should_have_mother_board, :should_have_ram
  validate :should_have_graphic_cards, unless: proc { mother_board_has_graphic_cards? }
  validate :should_have_only_one_graphic_card

  validate :should_respect_max_ram, if: proc { mother_board.present? && rams.any? }
  validate :should_respect_slot_memory_limit, if: proc { mother_board.present? }
  validate :should_respect_cpu_support, if: proc { mother_board.present? && cpu.present? }

  def cpu
    @cpu ||= order_products.detect(&:cpu?)
  end

  def mother_board
    @mother_board ||= order_products.detect(&:mother_board?)
  end

  def rams
    @rams ||= order_products.select(&:ram?)
  end

  def graphic_card
    @graphic_card ||= order_products.detect(&:graphic_card?)
  end

  def compatible_cpu?
    return false if mother_board.nil? || cpu.nil?

    mother_board.amd_intel? || mother_board.cpu_support == cpu.cpu_support
  end

  def mother_board_has_graphic_cards?
    mother_board.onboard_graphics?
  rescue StandardError
    false
  end

  private

  def should_have_cpu
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
    return unless rams.sum(&:gb_size) > mother_board.max_ram

    errors.add(:ram,
               "Your mother board can only have #{mother_board.max_ram} GB size")
  end

  def should_respect_slot_memory_limit
    return unless rams.size > mother_board.ram_slot

    errors.add(:ram,
               "Your mother board can only have #{mother_board.ram_slot} slots")
  end

  def should_respect_cpu_support
    errors.add(:mother_board, "Your mother board does not support #{cpu.cpu_support}") unless compatible_cpu?
  end

  def should_have_only_one_graphic_card
    errors.add(:graphic_card, 'You can have only 1 graphic card') if order_products.select(&:graphic_card?).size >= 2
  end
end
