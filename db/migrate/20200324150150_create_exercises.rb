class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.string :category
      t.string :title
      t.string :amount_unit
      t.integer :amount
      t.string :score_unit
      t.boolean :rank_by_max, default: true
      t.text :description

      t.timestamps
    end
  end
end
