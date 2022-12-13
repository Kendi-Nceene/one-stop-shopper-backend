class Product < ApplicationRecord
    belongs_to :category
    has_many :product_in_carts
    has_many :users, through: :product_in_carts
    has_many :reviews
    has_many :users, through: :reviews
end
