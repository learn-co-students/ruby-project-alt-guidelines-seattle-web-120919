class Game < ActiveRecord::Base
    belongs_to :user
    has_many :words
end
