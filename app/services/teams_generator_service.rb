class TeamsGeneratorService < BaseService
  def call
    Team::EXPECTED_TEAMS_COUNT.times do |item|
      Team.create!(title: "Team-#{item}")
    end
  end
end
