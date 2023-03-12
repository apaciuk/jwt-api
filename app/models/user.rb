class User < ApplicationRecord
include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :trackable 
  devise :jwt_authenticatable, jwt_revocation_strategy: self 

  attr_accessor :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :phone_number, :address, :city, :state, :zip_code, :country, :role, :status, :created_at, :updated_at, :jti

  def jwt_payload
    super
  end
  
end
