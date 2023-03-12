# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  include FastJsonapi
  respond_to :json

  private 

  def respond_with(resource, _opts = {})
        render json: {
          status: {code: 200 },
          data: UserSerializer.new(resource).serializable_hash.to_json, status: :success, serializer: UserSerializer, meta: { message: "User logged in successfully" }
        }, status: :ok
  end 

  def respond_to_on_destroy
  jwt_payload = JWT.decode(request.headers["Authorization"].split(" ").last,
      Rails.application.credentials.fetch(:secret_key_base), true, { algorithm: "HS256" }).first
      current_user = User.find(jwt_payload["sub"])
      if current_user 
        render json: {
          status: {code: 200 },
          data: UserSerializer.new(current_user).serializable_hash.to_json, serializer: UserSerializer, meta: { message: "User logged out successfully" }
        }, status: :ok
      else
        render json: {
          status: {code: 401 },
          data: nil, serializer: UserSerializer, meta: { message: "User has no active sessions" }
        }, status: :unauthorized
      end
  end

end
