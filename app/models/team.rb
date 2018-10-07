class Team < ApplicationRecord
  EXPECTED_TEAMS_COUNT = 16

  has_many :team_scores, dependent: :destroy
  has_many :matches, through: :team_scores
  has_and_belongs_to_many :groups

  validates :title, presence: true, uniqueness: true
end
