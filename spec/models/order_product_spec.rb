require 'rails_helper'

RSpec.describe OrderProduct, type: :model do
  it{ is_expected.to belong_to(:order).required(true) }
  it{ is_expected.to belong_to(:product).required(true) }
  
  %i[cpu? mother_board? product_information].each do |attribute|
    it { should delegate_method(attribute).to(:product).allow_nil }
  end

  it { should validate_numericality_of(:quantity).is_greater_than(0) }
  it { should validate_numericality_of(:quantity).is_less_than_or_equal_to(99) }

  context "quantity should be one when is a cpu" do
    before { allow(subject).to receive(:cpu?).and_return(true) }
    it { should validate_numericality_of(:quantity).is_equal_to(1) }
  end

  context "quantity should be one when is a mother board" do
    before { allow(subject).to receive(:mother_board?).and_return(true) }
    it { should validate_numericality_of(:quantity).is_equal_to(1) }
  end
end
