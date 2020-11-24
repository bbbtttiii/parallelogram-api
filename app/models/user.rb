class User < ApplicationRecord
    has_secure_password
    has_many :favorites
    has_many :articles, through: :favorites
    validates :username, uniqueness: true, presence: true
    validates :email, uniqueness: true, presence: true
    validates :password, presence: true, length: {within: 6..40}
end
