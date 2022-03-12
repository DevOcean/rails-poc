class Establishment < ApplicationRecord
  # Associations
  has_one :address
  has_many :users
  has_many :events

  # Nested attributes
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :users
  has_many :managers, through: :users
end
