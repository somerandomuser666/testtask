class MatchGenerator < BaseService
  def call(team1:, team2:, group:)
    Match.transaction do
      match = Match.new(group: group)
      match.team_scores.new(team: team1, score: rand(10))
      match.team_scores.new(team: team2, score: rand(10))
      match.save!
      match
    end
  end
end
