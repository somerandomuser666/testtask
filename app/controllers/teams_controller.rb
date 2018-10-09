class TeamsController < ApplicationController
  before_action :check_teams_count, only: :create
  def create
    service = TeamsGeneratorService.new
    if service.call
      redirect_to root_path flash[:notice] = "#{Team::EXPECTED_TEAMS_COUNT} teams was created"
    else
      redirect_to root_path flash[:notice] = "Something got wrong... Teams with this title has been already created"
    end
  end
  private
  def check_teams_count
    if Team.count == Team::EXPECTED_TEAMS_COUNT
      flash[:notice] = "You have enough teams for tournament"
      redirect_to root_path
    end
  end
end
