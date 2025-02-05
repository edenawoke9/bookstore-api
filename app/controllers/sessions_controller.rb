class SessionsController < ApplicationController
    def create
      user = User.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        token = generate_token(user)
        render json: { token: token, user: { id: user.id, email: user.email, role: user.role } }
      else
        render json: { error: "Invalid credentials" }, status: :unauthorized
      end
    end
  
    private
  
    def generate_token(user)
      JWT.encode({ user_id: user.id }, Rails.application.credentials.secret_key_base, 'HS256')
    end
    
  end
  