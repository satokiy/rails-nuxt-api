class User < ApplicationRecord
  # bycript  
  has_secure_password

  ### validation
  VALID_PASSWORD_REGEX = /\A[\w\-]+\z/

  validates :name,
    presence: true,
    length: { maximum: 30, allow_blank: true }

  validates :password, 
    presence: true,
    length: { minimum: 8 },
    format: { with: VALID_PASSWORD_REGEX },
    allow_nil: true
  
  validates :activated,
    inclusion: { in: [ true, false ] }

  
end
