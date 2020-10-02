class LovedOne < ApplicationRecord
    has_many :present_ideas, :dependent => :delete_all
    has_many :interests, :dependent => :delete_all
    belongs_to :user

    validates :name, presence: {message: "Must include your loved one's name!"}
    validates :birthday, presence: {message: "What is their birthday? You can update this later..."}
end
