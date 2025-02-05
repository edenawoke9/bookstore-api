class CartItemsController < ApplicationController
    before_action :authorize_user
  
    def create
      cart = Cart.find_or_create_by(user_id: session[:user_id], status: "active")
      cart_item = cart.cart_items.create(book_id: params[:book_id], quantity: params[:quantity])
  
      if cart_item.persisted?
        render json: { message: "Book added to cart." }, status: :created
      else
        render json: { errors: cart_item.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def authorize_user
      render json: { error: "Please log in." }, status: :unauthorized unless session[:user_id]
    end
  end
  