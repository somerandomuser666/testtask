class MatchGenerator < BaseService
  def call(team1:, team2:, group:)
    Match.transaction do
      match = Match.new(group: group)
      game_score = 10.times.map { rand(10) }.uniq.last(2)
      match.team_scores.new(team: team1, score: game_score.first)
      match.team_scores.new(team: team2, score: game_score.last)
      match.save!
      match
    end
  end
end
