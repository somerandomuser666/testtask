class EraseController < ApplicationController
  def destroy
    ApplicationRecord.transaction do
      Team.all.each(&:destroy!)
      Group.all.each(&:destroy!)
      Match.all.each(&:destroy!)
    end
    redirect_to root_path flash[:notice] = "All Games Teams and Matches was destroyed"
  end
end
