class CreateMetcons < ActiveRecord::Migration[6.0]
  def change
    create_table :metcons do |t|
      t.string :title
      t.text :description
      t.string :score_by

      t.timestamps
    end
  end
end
