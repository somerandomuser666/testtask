class WelcomeController < ApplicationController
  def index
    @teams = Team.all
    @groups = Group.all
    @matches = Match.all
  end
end
