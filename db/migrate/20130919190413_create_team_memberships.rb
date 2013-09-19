class CreateTeamMemberships < ActiveRecord::Migration
  def change
    create_table :team_memberships do |t|
      t.integer :team_id, index: true
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
