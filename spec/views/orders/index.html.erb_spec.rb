# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'orders/index', type: :view do
  before(:each) do
    assign(:orders, [
             Order.create!(
               user_id: 2,
               total: '9.99',
               status: 3
             ),
             Order.create!(
               user_id: 2,
               total: '9.99',
               status: 3
             )
           ])
  end

  it 'renders a list of orders' do
    render
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: 3.to_s, count: 2
  end
end
