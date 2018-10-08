class GroupsController < ApplicationController
  # before_action :check_groups_count, only: :auto_generate
  def index
  end

  def auto_generate
    GroupsGeneratorService.new.call
    flash[:notice] = "#{Group.count} groups was created"
    redirect_to root_path
  end

  def play_off_generate
    PlayOffGeneratorService.new.call
    flash[:notice] = "#Play off groups was created"
    redirect_to root_path
  end

  def final_generate
    FinalGeneratorService.new.call
    FinalGeneratorService.new.call
    FinalGeneratorService.new.call
    redirect_to root_path
  end

  private

  # def check_groups_count
  #   return unless Group.count == Group::EXPECTED_COUNT
  #   flash[:notice] = I18n.t("enough_groups")
  #   redirect_to root_path
  # end
end
