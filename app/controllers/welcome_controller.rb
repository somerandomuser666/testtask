class WelcomeController < ApplicationController
  def index
    @teams = Team.all
    @groups = Group.all
    @matches = Match.all
    @group_matches = @matches.where(group_id: Group.where(title: "play_off"))
    @_1_4_matches =  @matches.where(group_id: Group.where(title: "1_4"))
    @_1_2_matches =  @matches.where(group_id: Group.where(title: "1_2"))
    @final_matches =  @matches.where(group_id: Group.where(title: "final"))
  end
end
