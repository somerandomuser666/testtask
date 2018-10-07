class CreateTeamScores < ActiveRecord::Migration[5.1]
  def change
    create_table :team_scores do |t|
      t.belongs_to :match, foreign_key: true
      t.belongs_to :team, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
