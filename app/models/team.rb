class Team < ApplicationRecord
    has_many :users, dependent: :nullify
    has_many :team_games
    has_many :games, through: :team_games, dependent: :destroy
end
