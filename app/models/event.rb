class Event < ApplicationRecord
  # Associations
  belongs_to :establishment

  # Enums
  enum status: %i(pending validated canceled)
end
