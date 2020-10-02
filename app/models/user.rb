class User < ApplicationRecord
    has_many :loved_ones, :dependent => :delete_all
    has_many :present_ideas, through: :loved_ones
    has_many :interests, through: :loved_ones

    validates :username, presence: true, uniqueness: {case_sensitive: false, message: "already exists"}
    validates :name, presence: true
    validates :email, presence: true, uniqueness: {case_sensitive: false, message: "already exists"}
    validates :password, length: {minimum: 6, maximum: 15, message: "must be between 6 and 15 characters"}
    has_secure_password
end
