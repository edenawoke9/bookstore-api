class Book < ApplicationRecord
  belongs_to :category
  has_many :cart_items
  has_many :order_items
  has_many :reviews
  has_many :wishlists
end
