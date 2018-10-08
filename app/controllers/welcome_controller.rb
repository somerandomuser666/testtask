class WelcomeController < ApplicationController
  def index
    @teams = Team.all
    @groups = Group.all
    @matches = Match.all
    @group_matches = @matches.where(group_id: Group.where(title: "play_off"))
  end
end
