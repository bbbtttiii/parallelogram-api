class User < ApplicationRecord
    has_secure_password
    has_many :favorites
    has_many :articles, through: :favorites
    validates :username, :email, uniqueness: true, presence: true
    validates :password_digest, presence: true, length: {:within => 6..40},
end
