class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.string :user_id
      t.string :game_id
      t.integer :points
      
      t.timestamps
    end
  end
end
