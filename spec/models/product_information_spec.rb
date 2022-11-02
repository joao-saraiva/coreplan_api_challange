require 'rails_helper'

RSpec.describe ProductInformation, type: :model do
  it{ is_expected.to belong_to(:product).required(true) }

  context "validate presence of cpu support if is a cpu" do
    before { allow(subject).to receive(:cpu?).and_return(true) }
    it { is_expected.to validate_presence_of(:cpu_support) }
  end

  context "validate presence of attributes if is a mother board" do
    before { allow(subject).to receive(:mother_board?).and_return(true) }
    %i[cpu_support ram_slot max_ram].each do |attribute|
      it { is_expected.to validate_presence_of(attribute) }
    end
  end

  context "validate presence of gb size support if is a ram" do
    before { allow(subject).to receive(:ram?).and_return(true) }
    it { is_expected.to validate_presence_of(:gb_size) }
  end

  context "validate presence of gb size support if is a graphic card" do
    before { allow(subject).to receive(:graphic_card?).and_return(true) }
    it { is_expected.to validate_presence_of(:gb_size) }
  end

  it { should define_enum_for(:cpu_support).with([:amd, :intel, :amd_intel]) }

  %i[ram? mother_board? graphic_card? cpu?].each do |attribute|
    it { should delegate_method(attribute).to(:product).allow_nil }
  end
end
