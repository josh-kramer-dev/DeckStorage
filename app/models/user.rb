class User < ApplicationRecord
  has_secure_password
  has_many :decks
  has_many :cards, through: :decks

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true

end
