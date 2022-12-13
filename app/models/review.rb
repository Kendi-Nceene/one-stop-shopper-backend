class Review < ApplicationRecord
    validates :rating, presence: true, numericality: { in: 1..5 }
    validates :comment, presence: true
    belongs_to :user
    belongs_to :product
end
