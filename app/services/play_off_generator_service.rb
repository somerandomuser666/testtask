class PlayOffGeneratorService < BaseService
  def call
    @play_off = Group.create!(title: 'play_off')
    fill_group
    generate_matches
    @play_off.teams.first
  end

  private

  def fill_group
      @my_teams = []
      @my_teams << sort_teams_by_score( Team.joins(:groups).includes(:team_scores).where(groups: {title: 'A'}))[4..7]
      @my_teams << sort_teams_by_score( Team.joins(:groups).includes(:team_scores).where(groups: {title: 'B'}))[4..7]
      @my_teams.flatten!
      @play_off.teams << @my_teams
  end

  def generate_matches
    while @my_teams.size > 0
      match = MatchGenerator.call(team1: @my_teams.first, team2: @my_teams.last, group: @play_off)
      @my_teams.pop
      @my_teams.shift
    end
  end

  def sort_teams_by_score(teams)
    teams.to_a.sort_by! { |t| t.team_scores.sum(&:score) }
  end
end
