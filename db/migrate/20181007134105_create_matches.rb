class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.belongs_to :group

      t.timestamps
    end
  end
end
