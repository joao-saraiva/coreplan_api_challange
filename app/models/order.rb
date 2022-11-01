class Order < ApplicationRecord

  belongs_to :user, required: true

  enum status: {
    created: 1,
    confirmed: 2,
    sent: 3,
    delivered: 4 
  }

end
