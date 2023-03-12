class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :created_at, :updated_at, :first_name, :last_name, :phone_number, :address, :city, :postcode, :country, :jti

  attribute :full_name do |object|
    "#{object.first_name} #{object.last_name}"
  end

  attribute :address do |object|
    "#{object.address}, #{object.city}, #{object.state}, #{object.zip_code}, #{object.country}"
  end

 
end
