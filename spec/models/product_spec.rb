# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  %i[name brand].each do |attribute|
    it { is_expected.to validate_presence_of(attribute) }
  end

  it { is_expected.to have_one(:product_information) }

  it { should define_enum_for(:category).with(%i[cpu mother_board ram graphic_card]) }

  %i[amd_intel? cpu_support onboard_graphics?].each do |attribute|
    it { should delegate_method(attribute).to(:product_information).allow_nil }
  end
end
