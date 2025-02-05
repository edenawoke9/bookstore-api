class OrdersController < ApplicationController
    before_action :authorize_user
  
    def create
      cart = Cart.find_by(user_id: session[:user_id], status: "active")
      return render json: { error: "Cart is empty." }, status: :unprocessable_entity if cart.nil?
  
      order = Order.create(user_id: session[:user_id], total_price: cart.cart_items.sum { |item| item.book.price * item.quantity }, status: "pending")
      cart.cart_items.each do |item|
        OrderItem.create(order: order, book: item.book, quantity: item.quantity, price: item.book.price)
      end
  
      cart.update(status: "checked_out")
      render json: { message: "Order placed successfully." }, status: :created
    end
  
    private
  
    def authorize_user
      render json: { error: "Please log in." }, status: :unauthorized unless session[:user_id]
    end
  end
  