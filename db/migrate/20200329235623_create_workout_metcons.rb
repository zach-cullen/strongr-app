class CreateWorkoutMetcons < ActiveRecord::Migration[6.0]
  def change
    create_table :workout_metcons do |t|
      t.integer :workout_id
      t.integer :metcon_id

      t.timestamps
    end
  end
end
