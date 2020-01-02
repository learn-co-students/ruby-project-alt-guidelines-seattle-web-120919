class User < ActiveRecord::Base
    # @user.destroy deletes a user and all of their games
    has_many :games, dependent: :destroy 
    has_many :words, through: :games


end
