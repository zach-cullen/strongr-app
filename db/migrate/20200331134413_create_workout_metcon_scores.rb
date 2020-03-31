class CreateWorkoutMetconScores < ActiveRecord::Migration[6.0]
  def change
    create_table :workout_metcon_scores do |t|
      t.integer :workout_metcon_id
      t.integer :user_id
      t.integer :score

      t.timestamps
    end
  end
end
