class User < ApplicationRecord
    has_secure_password
    has_many :favorites
    has_many :articles, through: :favorites
end
