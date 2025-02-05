class User < ApplicationRecord
    has_secure_password
  
    has_many :carts
    has_many :orders
    has_many :reviews
    has_many :wishlists
  
   
  end