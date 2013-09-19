class AddTeamIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :team_id, :integer, index: true
  end
end
