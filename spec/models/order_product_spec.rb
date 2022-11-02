require 'rails_helper'

RSpec.describe OrderProduct, type: :model do
  it{ is_expected.to belong_to(:order).required(true) }
  it{ is_expected.to belong_to(:product).required(true) }
  
  %i[cpu? mother_board? product_information].each do |attribute|
    it { should delegate_method(attribute).to(:product).allow_nil }
  end
end
