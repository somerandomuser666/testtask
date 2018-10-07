class EraseController < ApplicationController
  def erase
    Team.destroy_all
    Group.destroy_all
    Match.destroy_all

    redirect_to root_path
  end
end
