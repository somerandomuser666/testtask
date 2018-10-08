class PlayOffGeneratorService < BaseService
  def call
    @play_off = Group.create!(title: 'play_off')
    fill_group
    generate_matches
    @play_off.teams.first
  end

  private

  def fill_group
    %w[A B].each do |letter|
      @play_off.teams << sort_teams_by_score(
        Team.joins(:groups)
            .includes(:team_scores)
            .where(groups: {title: letter})
      )[0..4]
    end
  end

  def generate_matches
    while @play_off.teams.size > 1
      match = MatchGenerator.call(team1: best_team, team2: worst_team, group: @play_off)
      looser = match.team_scores.order(:score).first.team
      @play_off.teams.delete(looser)
    end
  end

  def best_team
    sort_teams_by_score(@play_off.teams).first
  end

  def worst_team
    sort_teams_by_score(@play_off.teams).last
  end

  def sort_teams_by_score(teams)
    teams.sort do |team1, team2|
      team2.team_scores.sum(&:score) <=> team1.team_scores.sum(&:score)
    end
  end
end
