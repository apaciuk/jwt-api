# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController 
include FastJsonapi
respond_to :json

    private 

    def respond_with(resource, _opts = {})
        if resource.persisted?
            render json: UserSerializer.new(resource).serializable_hash.to_json, status: :created, location: after_sign_up_path_for(resource), serializer: UserSerializer,  meta: { message: "User created successfully" }
        else
            render json: resource.errors, status: :unprocessable_entity, serializer: UsersSerializer, adapter: :json_api, meta: { message: "User not created" }
        end
    end

end
