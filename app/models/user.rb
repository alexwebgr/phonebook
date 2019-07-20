class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true
  validates :email, uniqueness: true

  has_secure_password

  has_many :contacts, dependent: :destroy
end
