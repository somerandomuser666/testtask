class TeamsGeneratorService < BaseService
  def call
    Team::EXPECTED_TEAMS_COUNT.times do |item|
      Team.create!(title: "Team-#{item+1}")
    end
  end
end
