class FinalGeneratorService < BaseService
  def call
    matches = Match.where(group: Group.last).includes(:team_scores)
    @winner_teams = []
    matches.each do |match|
      @winner_teams << match.team_scores.order(score: :desc).first.team
    end

    @current_group = case Group.last.title
                       when "play_off" then Group.create!(title: '1_4')
                       when "1_4"      then Group.create!(title: '1_2')
                       when "1_2"      then Group.create!(title: 'final')
                     end
    generate_matches
  end

  def generate_matches
    while @winner_teams.count > 0 do
      MatchGenerator.call(team1: @winner_teams.first, team2: @winner_teams.last, group: @current_group)
      @winner_teams.pop; @winner_teams.shift
    end
  end
end
