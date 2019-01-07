class Account < ApplicationRecord
  include EmailValidatable
  has_secure_password
  has_one :user

  validates :email, email: true, uniqueness: true
end
