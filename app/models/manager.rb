class Manager < ApplicationRecord
    belongs_to :user
    has_one :establishment, through: :user
end