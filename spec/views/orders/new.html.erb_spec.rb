# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'orders/new', type: :view do
  before(:each) do
    assign(:order, Order.new(
                     user_id: 1,
                     total: '9.99',
                     status: 1
                   ))
  end

  it 'renders new order form' do
    render

    assert_select 'form[action=?][method=?]', orders_path, 'post' do
      assert_select 'input[name=?]', 'order[user_id]'

      assert_select 'input[name=?]', 'order[total]'

      assert_select 'input[name=?]', 'order[status]'
    end
  end
end
