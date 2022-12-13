class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest
  has_many :product_in_carts
  has_many :products, through: :product_in_carts
end
