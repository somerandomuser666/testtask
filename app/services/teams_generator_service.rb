class TeamsGeneratorService < BaseService
  def call
    Team.destroy_all if Team.any?
    Team::EXPECTED_TEAMS_COUNT.times do |item|
      Team.create!(title: "Team-#{item+1}")
    end
    true
  rescue ActiveRecord::RecordInvalid
    false
  end
end
