class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :password_digest,presence: true, uniqueness: true
    has_many :product_in_carts
    has_many :products ,through: :product_in_carts
    has_many :reviews
    has_many :products, through: :reviews
    has_secure_password
end
