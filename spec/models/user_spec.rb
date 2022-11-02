require 'rails_helper'

RSpec.describe User, type: :model do
  %i[email password].each do |attribute|
    it{ is_expected.to validate_presence_of(attribute) }
  end

  it{ is_expected.to validate_uniqueness_of(:email) }
end
