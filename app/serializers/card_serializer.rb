class CardSerializer < ActiveModel::Serializer
  attributes :id, :name, :quantity, :deck_id, :created_at, :updated_at

  belongs_to :deck
end
