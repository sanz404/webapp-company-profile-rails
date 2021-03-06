class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :username, presence: true, uniqueness: true
    validates :password, length: { minimum: 5 }, if: -> { new_record? || !password.nil? }
    belongs_to :country, optional: false
end
