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
end
