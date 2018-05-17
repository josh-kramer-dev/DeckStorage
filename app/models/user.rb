class User < ApplicationRecord
  has_secure_password
  has_many :decks
  has_many :cards, through: :decks

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { in: 6..20 }

  def self.find_or_create_by_facebook(auth_hash)
    self.where(:uid => auth_hash['info']['uid']).first_or_create do |u|
      u.name = auth_hash['info']['name']
      u.email = auth_hash['info']['email']
      u.password = SecureRandom.hex(9)
    end
  end

end
