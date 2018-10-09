class GroupsController < ApplicationController
  before_action :check_teams_count, only: :create
  before_action :check_groups_count, only: :play_off_generate
  before_action :check_play_off, only: :final_generate

  def create
    GroupsGeneratorService.new.call
    redirect_to root_path flash[:notice] = "#{Group.count} groups was created"
  end

  def play_off_generate
    PlayOffGeneratorService.new.call
    redirect_to root_path flash[:notice] = "#Play off groups was created"
  end

  def final_generate
    3.times do FinalGeneratorService.new.call end
    redirect_to root_path flash[:notice] = "Final matches was created"
  end

  private

  def check_teams_count
    if Team.count != Team::EXPECTED_TEAMS_COUNT
      flash[:error] = "You don't have enough teams"
      redirect_to root_path
    end
  end

  def check_groups_count
    unless Group.any?
      flash[:error] = "You don't have enough groups"
      redirect_to root_path
    end
  end

  def check_play_off
    unless Group.where(title: "play_off").any?
      flash[:error] = "First generate play off"
      redirect_to root_path
    end
  end
end
