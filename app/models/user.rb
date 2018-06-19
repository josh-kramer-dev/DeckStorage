class User < ApplicationRecord
  has_secure_password
  has_many :decks
  has_many :cards, through: :decks
  has_many :formats, through: :decks

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { in: 6..20 }

  def self.find_or_create_by_facebook(auth_hash)
    user = User.find_or_create_by(:uid => auth_hash['uid']) do |u|
      u.name = auth_hash['info']['name']
      u.email = auth_hash['info']['email']
      u.password = SecureRandom.hex(9)
    end
  end

#user with the most decks, count on the deck ids
scope :user_with_the_most_decks, -> {where{}}

# where count(deck_id) desc limit 1


end
