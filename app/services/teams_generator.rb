class TeamsGenerator < BaseService
  def call
    16.times do |i|
      Team.create!(title: "team-#{i}")
    end
  end
end
