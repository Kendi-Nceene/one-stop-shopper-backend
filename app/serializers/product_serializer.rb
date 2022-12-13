class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :image_url
  belongs_to :category
  has_many :product_in_carts
  has_many :users, through: :product_in_carts
end
