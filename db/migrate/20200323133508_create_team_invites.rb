class CreateTeamInvites < ActiveRecord::Migration[6.0]
  def change
    create_table :team_invites do |t|
      t.integer :team_id
      t.integer :user_id

      t.timestamps
    end
  end
end
