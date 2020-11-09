# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :username, length: {maximum: 255}
end
