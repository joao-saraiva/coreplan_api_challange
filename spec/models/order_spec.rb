require 'rails_helper'

RSpec.describe Order, type: :model do
  it{ is_expected.to belong_to(:user).required(true) }

  it{ is_expected.to have_many(:order_products).dependent(:destroy) }
  it{ is_expected.to have_many(:products).through(:order_products) }

  describe "cpu" do 
    context "when have cpus" do 
      it "should return the first cpu" do 
        order = FactoryBot.build(:order, :complete)

        expect(order.cpu).to be_a OrderProduct
        expect(order.cpu.try(:cpu?)).to be_truthy
      end
    end

    context "when have 0 cpus" do 
      it "should return nil value" do 
        order = FactoryBot.build(:order)

        expect(order.cpu).to be_a NilClass
      end
    end
  end

  describe "mother_board" do 
    context "when have a mother board" do 
      it "should return the first mother board" do 
        order = FactoryBot.build(:order, :complete)

        expect(order.mother_board).to be_a OrderProduct
        expect(order.mother_board.try(:mother_board?)).to be_truthy
      end
    end

    context "when have 0 mother boards" do 
      it "should return the first mother board" do 
        order = FactoryBot.build(:order)

        expect(order.mother_board).to be_a NilClass
      end
    end
  end

  describe "rams" do 
    context "when have rams" do 
      it "should return an array with OrderProducts" do 
        order = FactoryBot.build(:order, :complete)

        expect(order.rams.empty?).to be_falsey
        expect(order.rams.first).to be_a OrderProduct
        expect(order.rams.first.try(:ram?)).to be_truthy
      end
    end

    context "when have 0 rams" do 
      it "should return an empty array" do 
        order = FactoryBot.build(:order)

        expect(order.rams.empty?).to be_truthy
      end
    end
  end

  describe "graphic_card" do 
    context "when have a graphic card" do 
      it "should return the first graphic card" do 
        order = FactoryBot.build(:order, :complete)

        expect(order.graphic_card).to be_a OrderProduct
        expect(order.graphic_card.try(:graphic_card?)).to be_truthy
      end
    end

    context "when have 0 mother boards" do 
      it "should return the first mother board" do 
        order = FactoryBot.build(:order)

        expect(order.graphic_card).to be_a NilClass
      end
    end
  end

  describe "compatible_cpu?" do 
    context "when have compatible cpu" do 
      it "should return true when both have the sam cpu support" do 
        order = FactoryBot.build(:order, :complete)

        expect(order.compatible_cpu?).to be_truthy
      end

      it "should return true when mother board support amd and intel at the same time" do
        order = FactoryBot.build(:order, :complete)
        order.mother_board.product.product_information.update_attribute(:cpu_support, 'amd_intel')

        expect(order.compatible_cpu?).to be_truthy
      end
    end

    context "when have no compatible cpu" do 
      it "should return false" do 
        order = FactoryBot.build(:order, :complete)
        order.mother_board.product.product_information.update_attribute(:cpu_support, 'amd')

        expect(order.compatible_cpu?).to be_falsey
      end
    end
  end

  describe "mother_board_has_graphic_cards?" do 
    context "when have a mother board" do 
      it "should return true when mother_board has onboard_graphics" do 
        order = FactoryBot.build(:order, :complete)
        order.mother_board.product.product_information.update_attribute(:onboard_graphics, true)

        expect(order.mother_board_has_graphic_cards?).to be_truthy
      end

      it "should return false when mother_board has onboard_graphics" do 
        order = FactoryBot.build(:order, :complete)

        expect(order.mother_board_has_graphic_cards?).to be_falsey
      end
    end

    context "when not have a mother_board" do
      it "should return false" do 
        order = FactoryBot.build(:order)

        expect(order.mother_board_has_graphic_cards?).to be_falsey
      end
    end
  end

  describe "should_have_cpu" do 
    context "valid" do 
      it "is valid when have a cpu" do 
        order = FactoryBot.build(:order, :complete)
        order.valid?

        expect(order.errors[:cpu]).to_not include "is required to complete your Order"
      end
    end

    context "invalid" do 
      it "its invalid when have no cpu" do 
        order = FactoryBot.build(:order)
        order.valid?

        expect(order.errors[:cpu]).to include "is required to complete your Order"
      end
    end
  end

  describe "should_have_mother_board" do 
    context "valid" do 
      it "is valid when have a mother board" do 
        order = FactoryBot.build(:order, :complete)
        order.valid?

        expect(order.errors[:mother_board]).to_not include "is required to complete your Order"
      end
    end

    context "invalid" do 
      it "its invalid when have no mother board" do 
        order = FactoryBot.build(:order)
        order.valid?

        expect(order.errors[:mother_board]).to include "is required to complete your Order"
      end
    end
  end

  describe "should_have_ram" do 
    context "valid" do 
      it "is valid when have a ram" do 
        order = FactoryBot.build(:order, :complete)
        order.valid?

        expect(order.errors[:ram]).to_not include "is required to complete your Order"
      end
    end

    context "invalid" do 
      it "its invalid when have no ram" do 
        order = FactoryBot.build(:order)
        order.valid?

        expect(order.errors[:ram]).to include "is required to complete your Order"
      end
    end
  end

  describe "should_have_graphic_cards" do 
    context "valid" do 
      it "is valid when have a graphic card" do 
        order = FactoryBot.build(:order, :complete)
        order.valid?

        expect(order.errors[:graphic_card]).to_not include "is required to complete your Order"
      end

      it "is valid when have no graphic card but mother board have an onboard graphic card" do 
        order = FactoryBot.build(:order)
        mother_board = FactoryBot.create(:product, :mother_board)
        mother_board.product_information.update_attribute(:onboard_graphics, true)

        order.order_products.build(product_id: mother_board.id)
        order.valid?

        expect(order.errors[:graphic_card]).to_not include "is required to complete your Order"
      end
    end

    context "invalid" do 
      it "is invalid when have no graphic card" do 
        order = FactoryBot.build(:order)
        order.valid?

        expect(order.errors[:graphic_card]).to include "is required to complete your Order"
      end
    end
  end

  describe "should_respect_max_ram" do
    context "valid" do 
      it "is valid when respect max ram from the mother baord" do 
        order = FactoryBot.build(:order, :complete)
        order.valid?

        expect(order.errors[:ram]).to_not include "Your mother board can only have #{order.mother_board.max_ram} GB size"
      end
    end

    context "invalid" do 
      it "is invalid when total ram is greater than mother board support" do 
        order = FactoryBot.build(:order, :complete)
        order.rams.first.product.product_information.update_attribute(:gb_size, 64)
        order.valid?
  
        expect(order.errors[:ram]).to include "Your mother board can only have #{order.mother_board.max_ram} GB size"
      end
    end
  end

  describe "should_respect_slot_memory_limit" do 
    context "valid" do 
      it "is valid when total of ram component is less or equal to mother board total slot" do
        order = FactoryBot.build(:order, :complete)

        expect(order.errors[:ram]).to_not include "Your mother board can only have #{order.mother_board.ram_slot} slots"
      end
    end

    context "invalid" do 
      it "is invalid when total of ram component is greater than mother board total slot" do
        order = FactoryBot.build(:order, :complete_multiple_memories)
        order.valid?

        expect(order.errors[:ram]).to include "Your mother board can only have #{order.mother_board.ram_slot} slots"
      end
    end
  end

  describe "should_respect_cpu_support" do 
    context "valid" do 
      it "is valid when both have the same cpu support" do 
        order = FactoryBot.build(:order, :complete)
        order.valid?

        expect(order.errors[:mother_board]).to_not include "Your mother board does not support #{order.cpu.cpu_support}"
      end

      it "is valid when mother board support amd and intel at the same time" do
        order = FactoryBot.build(:order, :complete)
        order.mother_board.product.product_information.update_attribute(:cpu_support, 'amd_intel')
        order.valid?

        expect(order.errors[:mother_board]).to_not include "Your mother board does not support #{order.cpu.cpu_support}"
      end
    end

    context "invalid" do 
      it "is invalid when mother board does not support cpu" do 
        order = FactoryBot.build(:order, :complete)
        order.mother_board.product.product_information.update_attribute(:cpu_support, 'amd')
        order.valid?

        expect(order.errors[:mother_board]).to include "Your mother board does not support #{order.cpu.cpu_support}"
      end
    end
  end

  describe "should_have_only_one_graphic_card" do 
    context "valid" do 
      it "is valid when total of ram component is less or equal to mother board total slot" do
        order = FactoryBot.build(:order, :complete)

        expect(order.errors[:graphic_card]).to_not include "You can have only 1 graphic card"
      end
    end

    context "invalid" do 
      it "is invalid when total of ram component is greater than mother board total slot" do
        order = FactoryBot.build(:order, :complete_multiple_graphic_cards)
        order.valid?

        expect(order.errors[:graphic_card]).to include "You can have only 1 graphic card"
      end
    end
  end
end


