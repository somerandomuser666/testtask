class Match < ApplicationRecord
  has_many :team_scores, dependent: :destroy
  has_many :teams, through: :team_scores
  belongs_to :group
end
