class User < ApplicationRecord
    has_many :loved_ones
    has_many :gift_ideas, through: :loved_ones

    validates :username, presence: true, uniqueness: {case_sensitive: false, message: "Username already exists"}
    validates :name, presence: {message: "Must include name"}
    validates :email, presence: true, uniqueness: {case_sensitive: false, message: "That email already exists"}
    validates :password, length: {minimum: 6, maximum: 15, message: "Password must be between 6 and 15 characters"}
    has_secure_password
end
