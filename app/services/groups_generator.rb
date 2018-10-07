class GroupsGenerator < BaseService
  def call
    create_groups
    fill_groups
    generate_matches(@group1)
    generate_matches(@group2)
  end

  private

  def create_groups
    @group1 = Group.create!(title: 'A')
    @group2 = Group.create!(title: 'B')
  end

  def fill_groups
    Team.all.shuffle.each_with_index do |team, index|
      (index % 2).zero? ? @group1.teams << team : @group2.teams << team
    end
  end

  def generate_matches(group)
    group.teams.to_a.combination(2) do |team1, team2|
      MatchGenerator.call(team1: team1, team2: team2, group: group)
    end
  end
end
