class Word < ActiveRecord::Base
    belongs_to :game
    belongs_to :category
    has_many :users, through: :games
end