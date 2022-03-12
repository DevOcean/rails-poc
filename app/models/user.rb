class User < ApplicationRecord
  # Associations
  belongs_to :establishment
  has_one :manager
end
