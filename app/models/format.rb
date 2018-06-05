class Format < ApplicationRecord

has_many :decks

# scope :filter_by_format -> (format_name) { where("name == ?", format_name)}


end
