class Deck < ApplicationRecord
  belongs_to :user
  belongs_to :format
  
  has_many :cards

  validates :name, presence: true


end
