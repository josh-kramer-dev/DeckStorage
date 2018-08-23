class DeckSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :format_id, :created_at, :updated_at

  has_many :cards 
end
