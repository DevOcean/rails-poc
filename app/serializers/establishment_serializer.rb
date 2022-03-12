class EstablishmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :registration_number

  has_one :address
  has_many :users
  has_many :events
end
