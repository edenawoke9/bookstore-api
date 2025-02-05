class BooksController < ApplicationController
    before_action :authorize_admin, only: [:create]
  
    def index
      books = Book.all
      render json: books
    end
  
    def create
      book = Book.new(book_params)
      if book.save
        render json: { message: "Book added successfully." }, status: :created
      else
        render json: { errors: book.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def book_params
      params.permit(:title, :author, :price, :description, :stock, :category_id)
    end
  
    def authorize_admin
      user = User.find(session[:user_id]) rescue nil
      render json: { error: "Not authorized." }, status: :forbidden unless user&.admin?
    end
  end
  