class CreateWorkoutExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :workout_exercises do |t|
      t.integer :team_id
      t.integer :exercise_id

      t.timestamps
    end
  end
end
