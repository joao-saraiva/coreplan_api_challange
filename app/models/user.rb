# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, :password, presence: true
  validates :email, uniqueness: true

  before_create :encrypt_password

  def token
    payload = { id: id }
    JWT.encode(payload, ENV['API_SECRET'], 'HS256')
  end

  private

  def encrypt_password
    payload = { id: password }

    self.password = JWT.encode(payload, ENV['API_SECRET'], 'HS256')
  end
end
