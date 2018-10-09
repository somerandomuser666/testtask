class WelcomeController < ApplicationController
  def index
    @teams = Team.all
    @groups = Group.all
    @matches = Match.all
    @group_matches = @matches.first(56)
    @group_matches_first_half = @group_matches.first(28)
    @group_matches_last_half = @group_matches.last(28)
    @group_a_teams = Team.joins(:groups).includes(:team_scores).where(groups: {title: 'A'})
    @group_b_teams = Team.joins(:groups).includes(:team_scores).where(groups: {title: 'B'})

    @play_off_matches = @matches.where(group_id: Group.play_off)
    @_1_4_matches =  @matches.where(group_id: Group.quarter_final)
    @_1_2_matches =  @matches.where(group_id: Group.half_final)
    @final_matches =  @matches.where(group_id: Group.final)
  end
end
