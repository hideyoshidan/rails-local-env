class User < ApplicationRecord
  include Discard::Model

  has_secure_password validations: false

  # validations
  validates :user_name,
    presence: true, 
    length: {minimum: 1, maximum: 15}
  validates :email,
    presence: true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password,
    presence: true,
    format: { with: /\A[a-z,0-9]{4,}\z/ },
    uniqueness: { case_sensitive: false } # DBに保存する前に小文字
end