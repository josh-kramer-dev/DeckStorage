class CardSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :deck_id, :created_at, :updated_at

  belongs_to :deck
end
