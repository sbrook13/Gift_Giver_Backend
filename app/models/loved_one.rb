class LovedOne < ApplicationRecord
    has_many :present_ideas
    has_many :interests
    belongs_to :user

    validates :name, presence: {message: "Must include your loved one's name!"}
    validates :birthday, presence: {message: "What is their birthday? You can update this later..."}
end
