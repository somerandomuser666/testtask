class TeamsController < ApplicationController
  def auto_generate
    TeamsGeneratorService.new.call
    flash[:notice] = "#{Team::EXPECTED_TEAMS_COUNT - Team.count} teams was created"
    redirect_to root_path
  end
end
