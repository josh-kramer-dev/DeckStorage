class Deck < ApplicationRecord
  belongs_to :user
  belongs_to :format

  has_many :cards

  validates :name, presence: true

  scope :filter_by_format, ->(format_id) { where("format_id == ?", format_id) }


end
