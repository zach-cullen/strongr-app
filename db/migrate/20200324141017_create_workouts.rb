class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.integer :team_id
      t.date :date
      t.boolean :published

      t.timestamps
    end
  end
end
